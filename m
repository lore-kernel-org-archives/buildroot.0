From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 13:38:34 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
	postgresql
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
 <20150411124226.726fde30@free-electrons.com>
Message-ID: <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20150411124226.726fde30 at free-electrons.com: 

> Dear Bernd Kuhls,
> 
> On Sat, 11 Apr 2015 09:52:16 +0200, Bernd Kuhls wrote:
>> Configure misses libm and libpthread when checking for postgresql.
>> Patching configure.ac did not fix the problem so we patch configure
>> directly, 
> 
> Hum, why?
> 
> It seems a bit backward to remove AUTORECONF = YES to then add a patch
> that modifies the configure script directly.

Hi,

I tried to add "-lm -lpthread" to line 615 in configure.ac:

-     PGSQL_LIBS="-L`$PG_CONFIG --libdir` -lpq"
+     PGSQL_LIBS="-L`$PG_CONFIG --libdir` -lm -lpthread -lpq"

Original configure, line 17388, looks like this before autoreconf

LIBS="-lpq -L`$PG_CONFIG --libdir`

and, as line 17865, it still looks the same causing postgresql detection
to fail... 

Please note that -lpq is on the first position in this variable, I have no
idea how to change this line in configure without patching that file
directly. 

Regards, Bernd
