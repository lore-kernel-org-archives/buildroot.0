From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 03:01:13 +0100
Subject: [Buildroot] [PATCH 0/3] Allow toolchain to indicate if they support
 SSP strong
Message-ID: <20200220020117.695236-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the autobuilders, we are seen build failures when the old
CodeSourcery ARM toolchain is selected, and BR2_SSP_STRONG=y.

Indeed, this toolchain has gcc 4.8, and it doesn't support
-fstack-protector-strong.

Unfortunately, we cannot simply make BR2_SSP_STRONG depend on gcc >=
4.9, because as explained in the BR2_SSP_STRONG help text, some custom
toolchains with gcc < 4.9 have had the SSP strong support backported.

So, we introduce a BR2_TOOLCHAIN_HAS_SSP_STRONG hidden boolean. It is
enabled as soon as SSP is available *and* gcc >= 4.9, so that most
cases are covered without the need for each toolchain to select
BR2_TOOLCHAIN_HAS_SSP_STRONG.

The only case require special attention is custom external toolchains,
for which we add a visble Config.in option that allows the user to
explicitly indicate if the toolchain supports SSP strong.

Thanks to this small patch series, we will be able to avoid the build
failure in the autobuilders.

Thanks,

Thomas

Thomas Petazzoni (3):
  toolchain: add hidden BR2_TOOLCHAIN_HAS_SSP_STRONG boolean
  toolchain/toolchain-external/toolchain-external-custom: add option to
    indicate SSP_STRONG support
  Config.in: ensure BR2_SSP_STRONG can only be selected if supported

 Config.in                                            |  1 +
 toolchain/Config.in                                  |  4 ++++
 .../toolchain-external-custom/Config.in.options      | 12 ++++++++++++
 3 files changed, 17 insertions(+)

-- 
2.24.1
