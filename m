From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:16:52 +0100
Subject: [Buildroot] [PATCH] lightning: add -lintl only when needed
In-Reply-To: <1421763861-38874-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1421763861-38874-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150125181652.133d32ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 20 Jan 2015 14:24:21 +0000, Vicente Olivert Riera wrote:
> Adding -lintl to LIBS causes a failure in the configure phase when using
> a toolchain which already has locale support because the intl library is
> not present in the staging area. We fix this by adding -lintl only when
> is needed.
> 
> This is the configure error:
> 
> checking whether the C compiler works... no
> configure: error: in
> `/br/output/build/lightning-2.0.5':
> configure: error: C compiler cannot create executables
> See `config.log' for more details
> 
> This is the message in the config.log:
> 
> configure:3351: /br/output/host/usr/bin/mips-linux-gnu-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> conftest.c -lintl >&5
> /br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.9.1/../../../../mips-linux-gnu/bin/ld:
> cannot find -lintl
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>   http://autobuild.buildroot.net/results/280/28006ab35379a9b7f380d40b99a760bec1b69e84/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I applied, but in a much more simplified form: only change the
condition to pass LIBS=-lintl. It's not lightning itself that needs
gettext, but only the fact that binutils uses it, and forgets to link
with libintl. So I don't think we need/should express the dependency
against gettext in lightning, only pass LIBS=-lintl when needed.

See
http://git.buildroot.net/buildroot/commit/?id=b90fa707f3a3d43d54944e7b80ad6423f2f93667.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
