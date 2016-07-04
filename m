From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 21:48:04 +0200
Subject: [Buildroot] [PATCH] alsa-lib: Add option to allow calculations
	in float for soft float targets
In-Reply-To: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Sat, 7 May 2016 08:45:25
 +0200")
References: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87mvlxb2x7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > The `--with-softfloat` config option is a little bit misleading as it actually
 > means: "avoid calculations in float" [1].

 > Add a menu config option to allow floating point emulation for soft float
 > targets. This option is enabled by default for soft float targets.

 > [1]
 > http://git.alsa-project.org/?p=alsa-lib.git;a=blob;f=configure.ac;h=c265ec9e159bdf76a6829ab8f7d625ac72b25501;#l226

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

I had a look and the size difference is really quite small (65K):

-rwxr-xr-x 1 peko peko 774K Jul  4 18:50 target-orig/usr/lib/libasound.so.2.0.0
-rwxr-xr-x 1 peko peko 709K Jul  4 19:08 target-softfloat/usr/lib/libasound.so.2.0.0

So having an option for it imho doesn't make any sense.

The size difference basically all comes from the fact that the lfloat and
ladspa get disabled when --with-softfloat is passed. If these are
manually disabled (instead of passing all) the extra bloat is gone:

-rwxr-xr-x 1 peko peko 709K Jul  4 19:08 target-softfloat/usr/lib/libasound.so.2.0.0
-rwxr-xr-x 1 peko peko 709K Jul  4 21:34 target/usr/lib/libasound.so.2.0.0

So I've simply dropped --with-softfloat and marked this patch as
rejected.

-- 
Bye, Peter Korsgaard
