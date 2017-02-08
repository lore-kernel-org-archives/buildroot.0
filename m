From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 08 Feb 2017 15:50:31 +0100
Subject: [Buildroot] [PATCH] fakedate: simplify logic
In-Reply-To: <20170207220817.5781-1-peter@korsgaard.com>
References: <20170207220817.5781-1-peter@korsgaard.com>
Message-ID: <3055501.XEoAAfpss1@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tuesday 07 February 2017 23:08:17 Peter Korsgaard wrote:
[...]
> diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
> index 4a9b9b5e6..abe6b38f9 100755
> --- a/package/fakedate/fakedate
> +++ b/package/fakedate/fakedate
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # vim: set sw=4 expandtab:
>  #
>  # This program is free software; you can redistribute it and/or 
modify
> @@ -18,18 +18,12 @@
>  # Copyright (C) 2016 J?r?me Pouiller <jezz@sysmic.org>
>  #
>  
> -# Sanity check
> -if ! readlink -f "$0" | grep -q fakedate; then
> -    echo "fakedate: Please name this script \`fakedate'"
> -    exit 1
> -fi
> -
>  DATE_BIN=false
>  # Do not call `date' directly since it will produce an infinite 
recursion.
>  # Instead, find path of true `date' binary.
> -for P in `echo $PATH | tr ':' ' '`; do
> +IFS=':'; for P in $PATH; do

I think you have to reset $IFS to its previous value after used
it.

Globally, I dislike use of $IFS. I think it may produce unattended side 
effects.


>      if [ -x "$P/date" ]; then
> -        if readlink -f "$P/date" | grep -qv fakedate; then
> +        if ! [ "$P/date" -ef "$0" ]; then

Nice! I didn't know '-ef'.

>              DATE_BIN="$P/date"
>              break;
>          fi
> @@ -50,8 +44,8 @@ if [ -n "$SOURCE_DATE_EPOCH" ]; then
>      done
>      if [ $FORCE_EPOCH -eq 1 ]; then
>          echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of 
true time" >&2
> -        exec $DATE_BIN -d "@$SOURCE_DATE_EPOCH" "$@"
> +	ARGS="-d @$SOURCE_DATE_EPOCH"

Indentation seems incorrect: s/\t/        /

>      fi
>  fi
>  
> -exec $DATE_BIN "$@"
> +exec $DATE_BIN $ARGS "$@"

It's matter of taste.


> diff --git a/package/fakedate/fakedate.mk 
b/package/fakedate/fakedate.mk
> index 61d4bd702..e81ce5dac 100644
> --- a/package/fakedate/fakedate.mk
> +++ b/package/fakedate/fakedate.mk
> @@ -8,8 +8,7 @@
>  HOST_FAKEDATE_LICENSE = GPLv2+
>  
>  define HOST_FAKEDATE_INSTALL_CMDS
> -	$(INSTALL) -D -m 755 package/fakedate/fakedate 
$(HOST_DIR)/usr/bin/fakedate
> -	ln -sfn fakedate $(HOST_DIR)/usr/bin/date
> +	$(INSTALL) -D -m 755 package/fakedate/fakedate 
$(HOST_DIR)/usr/bin/date

Hmm... In order to not confuse user, I prefer to keep fakedate as 
original name and adding a symlink beside.

>  endef
>  
>  $(eval $(host-generic-package))
> 

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
