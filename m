From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 17:32:18 +0100
Subject: [Buildroot] [PATCH v2] Change host locale from C to en_US.UTF-8
 for reproducable builds
In-Reply-To: <20180131213629.4385-1-julius@kriukas.lt>
References: <20180128112205.15275-1-julius@kriukas.lt>
 <20180131213629.4385-1-julius@kriukas.lt>
Message-ID: <20180206173218.0511e7d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Jan 2018 23:36:29 +0200, Julius Kriukas wrote:
> When BR2_REPRODUCIBLE is enabled building systemd fails with error:
> 
> [1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
> FAILED: catalog/systemd.bg.catalog
> /buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
> Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
> You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
> Please switch to a UTF-8 locale for your platform.
> ...
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)
> package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
> make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1
> 
> Other packages using meson build system might fail as well.
> 
> This patch changes default host system locale from C to en_US.UTF-8 to
> fix this issue. It also introduces BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
> hidden flag that checks if this locale is available on the host system.
> If locale is not available error message is show and build process is
> stopped.
> 
> ---
> Changes v1 -> v2:
>   - Added BR2_NEEDS_HOST_EN_US_UTF8_LOCALE flag that is selected by
>     BR2_REPRODUCIBLE.
>   - Extended support/dependencies/dependencies.sh to check for
>     en_US.UTF-8 locale availability if BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
>     is set.
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>

Your SoB line should be before the "---" that separates the commit log
and the changelog.

However, I have a bigger issue with the patch: you're fixing the issue
for BR2_REPRODUCIBLE, but the problem actually appears also with a
non-BR2_REPRODUCIBLE build. Look at:

  http://autobuild.buildroot.net/results/257/25757c41d1a83edbe2a7c47b63ce2e43eb6141dc/build-end.log

This configuration does *not* have BR2_REPRODUCIBLE enabled. The system
on which it runs has several UTF-8 locales enabled:

$ locale -a
C
C.UTF-8
POSIX
en_US.utf8
fr_FR.utf8

But the POSIX locale is used:

$ locale
LANG=
LANGUAGE=
LC_CTYPE="POSIX"
LC_NUMERIC="POSIX"
LC_TIME="POSIX"
LC_COLLATE="POSIX"
LC_MONETARY="POSIX"
LC_MESSAGES="POSIX"
LC_PAPER="POSIX"
LC_NAME="POSIX"
LC_ADDRESS="POSIX"
LC_TELEPHONE="POSIX"
LC_MEASUREMENT="POSIX"
LC_IDENTIFICATION="POSIX"
LC_ALL=

And Meson fails in this situation. I believe it should be fixed in
Meson. We should not have to set a specific locale for the thing to
build. The need for the UTF-8 locale to be present is more or less OK,
but the need to have such a locale in *use* is annoying.

So perhaps your fix is needed because Meson will in the end really need
at least one UTF-8 locale available, but it is not complete because it
doesn't fix the non-BR2_REPRODUCIBLE situation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
