From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 21:16:44 +0200
Subject: [Buildroot] [PATCH v4] toolchain: improve SSP logic
In-Reply-To: <1458060038-38164-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1458060038-38164-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160523211644.6b54c857@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2016 16:40:38 +0000, Vicente Olivert Riera wrote:
> Don't enable SSP support on external toolchains just because they use
> glibc or musl. Instead of that, make the external toolchains explictily
> declare if they support SSP or not. And also add a check to detect SSP
> support when using custom external toolchains.
> 
> For internal toolchains we always enable SSP support for glibc and musl.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

A reference to some autobuilder failures was missing here, to justify
applying this on master rather than next, so I've added one.

> +check_toolchain_ssp = \
> +	__CROSS_CC=$(strip $1) ; \
> +	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp && echo y` ; \

I've redirected stdout/stderr from gcc to /dev/null in order to avoid
causing confusion for the user, who would have seen some weird gcc
errors when the ssp test fails.

And also, I've removed the existing SSP test which was done
specifically for uClibc external toolchains, since there is now a more
generic check for SSP, which works for all C libraries.

Applied to master with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
