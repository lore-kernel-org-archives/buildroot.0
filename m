From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 23:38:07 +0100
Subject: [Buildroot] [PATCH 1/1] Change host locale from C to
 en_US.UTF-8 for reproducable builds
In-Reply-To: <20180128112205.15275-1-julius@kriukas.lt>
References: <20180128112205.15275-1-julius@kriukas.lt>
Message-ID: <20180130233807.3bb4b570@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jan 2018 13:22:05 +0200, Julius Kriukas wrote:
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
> fix this issue. Any Unicode-compatible locale would be suitable here.
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>

Thanks for your patch! I was about to apply it, but one issue I see is
that we have no guarantee that en_US.UTF-8 is available.

support/dependencies/dependencies.sh checks that we have at least one
UTF-8 locale available if BR2_NEEDS_HOST_UTF8_LOCALE=y, but:

 - BR2_NEEDS_HOST_UTF8_LOCALE is only selected when a uClibc toolchain
   is being built

 - it only ensures one UTF-8 locale is available, not specifically
   en_US.UTF-8

Perhaps we need another BR2_NEEDS_HOST_EN_US_UTF8_LOCALE, which would
be used by support/dependencies/dependencies.sh to ensure that
en_US.UTF-8 is available. This new option would be selected by
BR2_REPRODUCIBLE.

Arnout, Peter, Yann? Thoughts?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
