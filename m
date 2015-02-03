From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 15:04:37 +0100
Subject: [Buildroot] [PATCH 1/1] dropbear: add extra build customization
 options
In-Reply-To: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150203150437.7d27225c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Thu, 11 Sep 2014 17:43:31 +0200, Floris Bos wrote:

> - Option to disable password authentication,
>   to only allow public key authentication instead

This can be done at runtime using the -s option, and presumably
disabling it at build time doesn't give much space savings, so we'd
rather not have a Config.in option for this.

> - Option to disable TCP forwarding.
>   Defaults to y, as most legitimate users are not using it,
>   and the feature is very popular with spammers that scan
>   for devices with weak passwords and use them to relay spam.

This can be done at runtime using the -j and -k options, so same logic
as for the password authentication disabling.

We'd however be open to merge the option to install or not the clients,
but we do have some comments/questions below.

> +ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
>  DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
>  DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
>  		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
> -
> -DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
> -DROPBEAR_LICENSE_FILES = LICENSE
> +else
> +DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
> +DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
> +		PROGRAMS="dropbear dropbearkey dropbearconvert scp"
> +endif

Why is scp part of the server-only installation?

Also, can you make this a bit smarter to avoid duplication. For example:

DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp

ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
DROPBEAR_TARGET_BINS += ssh dbclient
endif

And then use:

	PROGRAMS="dropbear $(DROPBEAR_TARGET_BINS)"

When doing the $(MAKE) call.

We'll mark your patch as 'Changes Requested' in patchwork, so can you
resend an updated version that takes into account those comments?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
