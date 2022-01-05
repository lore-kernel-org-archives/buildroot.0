Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 19:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F1A83112;
	Wed,  5 Jan 2022 19:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UECbA87PeKbL; Wed,  5 Jan 2022 19:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECA583103;
	Wed,  5 Jan 2022 19:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 475D51BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 19:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36E9A4162D
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 19:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=fastmail.com header.b="pnlr1xcI";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="Ki868rZb"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Opw10jF8API1 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 19:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6534241629
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 19:03:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9AF9D3200C4A
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 14:03:30 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute3.internal (MEProxy); Wed, 05 Jan 2022 14:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=C7mViq6ZNZ7EOGULjQzEqg/QLF/PeyXddvDg7AGOjGQ=; b=pnlr1xcI
 7pSwggOFWNDYsszuXCdeUtC6aehhRbOnD+5F50H05MKP4YmP6Fwy4431vOIxqM6T
 v6K//Ha7aZPcZkDjrbDUBoFrgEi5Kv36c3sudocAK6zQiXLqdBgwIk4UEKcnsvp3
 AhE/dDo/l8/l+bKI9O7o12qpnMhO0PlG8CkGySNB13GTe061wtvZrs4agaBOFLGl
 AmihhCtUBdWpaiR8jQ8u15/qEAfCLh+74zx34xmNo2KyMVsgy2y662pKDpbQxJVT
 m86Q/bjFy3c3qyt9iB19bYqC9A9JulDnO3FuYZKQ/OQUcI8yLnc2y+KYF062nX0H
 w7EhgddUU+QqeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=C7mViq6ZNZ7EOGULjQzEqg/QLF/Pe
 yXddvDg7AGOjGQ=; b=Ki868rZb0Tj+jft4+J8CHvnmspnff1oNv9ZYtcpeCh9Nz
 tPCIMo0KpAkjB+jw8rEEXKaWX4yNvlzYbkGFQXNSDUYR7L+YEtiouvJgGXAsrGs+
 FJ7SnQKwhZtR6LbywcA5N0BQzMGFbbUcvJP/asdo+v1o3ji5z1p9qJwYPoZQcSbm
 jIiEEKnEPCN/KQLWygJPH/jqbGfZIZFSNXUxd1+SbRJ5ilEueUB6kRp98GtZspJR
 mFuc06ylTPKMzXeqnZxt1Vd3kRcgW0ev1HiNxgLjcr6RDumnlJ0h//1S6wDs3C6M
 Tww9DWzNDIgGx4siD2WXZg5aM6QEdIkQx2n0L2PKQ==
X-ME-Sender: <xms:gevVYcEMjoCVzJC32U2m0Ebs8kDv3Pgt3MYnAUB2yRzNghociaepig>
 <xme:gevVYVXw0sN8SeuAdECCRX9mND3dW4JZu5tv3VgTHOF6XnEewoGlYwN5Z6H6bVFsR
 GkUQBW3VqJKEteEctU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsegrtderre
 erreejnecuhfhrohhmpedflfgvshhsvgcuofhilhhlfihoohgufdcuoehjvghsshgvpggu
 vghvsehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepleeihffftddvke
 ffffdvueekheeuieetleffveeftdfhfeffjeejleeifedvvddvnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgvshhsvggpuggvvhesfhgrsh
 htmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:gevVYWIKeSDJi0R-9l1oV2pOIcZFOLmbT9AZfM2GA5k0mhFSHJMe8A>
 <xmx:gevVYeHjGGZnNTDGrXLLz85tD2gzivGNUbIJCLoKWl7jWFV03tsang>
 <xmx:gevVYSXxBEMljqliCXrmorluUNP8ORnoMYFxijvQIVvkInBqxViEfA>
 <xmx:guvVYajucA934CpsZEG_G4cqomRH2tLIbYgAIfcTIsCM1EQN42fiRQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E21D2FA0AA6; Wed,  5 Jan 2022 14:03:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4525-g8883000b21-fm-20211221.001-g8883000b
Mime-Version: 1.0
Message-Id: <37282adb-8559-4124-874d-c1729bd3ce01@www.fastmail.com>
Date: Wed, 05 Jan 2022 14:03:09 -0500
From: "Jesse Millwood" <jesse_dev@fastmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Overriding Kconfig Values from external br2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0274290102671465667=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0274290102671465667==
Content-Type: multipart/alternative;
 boundary=ee66280776d64463b8b760ef47dbd890

--ee66280776d64463b8b760ef47dbd890
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,=20

I have an external C/C++ toolchain that I've put together that uses MUSL=
. I've also built an external Rust toolchain that uses my MUSL toolchain=
.=20

My issue is that there is a Rust Kconfig variable that specifies if a sp=
ecific architecture supports Rust.=20

The Kconfig variable in question is BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_S=
UPPORTS in package/rustc/Config.in.host.=20

In my br2 external project I have the following setup:=20



My issue is that I can't seem to override the BR2_PACKAGE_HOST_RUSTC_TAR=
GET_ARCH_SUPPORTS, which masks all other Rust packages.=20

.
=E2=94=9C=E2=94=80=E2=94=80 external.desc
=E2=94=82       |name: MINE
=E2=94=82       |desc: My BR2 External
=E2=94=82       `----
=E2=94=9C=E2=94=80=E2=94=80 external.mk
=E2=94=82       |include $(sort $(wildcard $(BR2_EXTERNAL_MINE_PATH)/pac=
kage/*/*.mk))
=E2=94=82       |include $(sort $(wildcard $(BR2_EXTERNAL_MINE_PATH)/too=
lchain/*/*.mk))
=E2=94=82       `----
=E2=94=9C=E2=94=80=E2=94=80 Config.in
=E2=94=82       | source "$BR2_EXTERNAL_MINE_PATH/toolchain/my-external/=
Config.in.options"
=E2=94=82       | source "$BR2_EXTERNAL_MINE_PATH/package/rpkg/Config.in"
=E2=94=82       `----
=E2=94=9C=E2=94=80=E2=94=80 configs
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 my_gnu_defconfig
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 my_musl_defconfig
|
=E2=94=9C=E2=94=80=E2=94=80 package
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 rpkg
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 Config.in
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 rpkg.mk
=E2=94=9C=E2=94=80=E2=94=80 provides
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 toolchains.in
=E2=94=82          | config BR2_TOOLCHAIN_EXTERNAL_MY_MUSL
=E2=94=82          | bool "My PowerPC MUSL Toolchain"
=E2=94=82          | depends on BR2_powerpc
=E2=94=82          |
=E2=94=82          | config BR2_TOOLCHAIN_EXTERNAL_MY_GNU
=E2=94=82          | bool "My PowerPC GNU Toolchain"
=E2=94=82          |         depends on BR2_powerpc
=E2=94=82          `----
=E2=94=94=E2=94=80=E2=94=80 toolchain
    =E2=94=94=E2=94=80=E2=94=80 my-external
        =E2=94=94=E2=94=80=E2=94=80 Config.in.options
                | if BR2_TOOLCHAIN_EXTERNAL_MY_MUSL
                | config BR2_TOOLCHAIN_EXTERNAL_PREFIX
                | default "powerpc-my-linux-musl"
                | config BR2_TOOLCHAIN_EXTERNAL_PATH
                | default "${WORKSPACE_DIR}/toolchain/powerpc-my-linux-m=
usl"
                |
                | config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
                | bool
                | default y if BR2_i386
                | default y if BR2_x86_64
                | default y if BR2_aarch64
                | default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM=
_CPU_ARMV5 \
                |         && !(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI)
                | default y if BR2_powerpc || BR2_powerpc64 || BR2_power=
pc64le
                | default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU=
_MIPS32R6
                | default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS=
_CPU_MIPS64R6 \
                | && BR2_MIPS_NABI64
                | depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_=
USES_MUSL)
                | depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
                |
                | endif
                |
                | if BR2_TOOLCHAIN_EXTERNAL_MY_GNU
                | config BR2_TOOLCHAIN_EXTERNAL_PREFIX
                | default "powerpc-my-linux-gnu"
                | config BR2_TOOLCHAIN_EXTERNAL_PATH
                | default "${WORKSPACE_DIR}/toolchain/powerpc-my-linux-g=
nu"
                | endif
                `----

You may notice that I changed the libc depends line to be or'd with BR2_=
TOOLCHAIN_USES_MUSL. It seems that this does not get considered when I c=
hoose my external musl toolchain option. In the menuconfig when I search=
 for the BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS variable with the "=
/" key it looks like it is only getting it from the original file. Does =
buildroot have a mechanism for overwriting this kind of setting and if n=
ot, does anyone have an idea of how I would accomplish what I am trying =
to do (make buildroot honor my external rust toolchain)?

Thanks,=20
Jesse
--ee66280776d64463b8b760ef47dbd890
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div style=3D"f=
ont-family:menlo, consolas, monospace;">Hello, <br></div><div style=3D"f=
ont-family:menlo, consolas, monospace;"><br></div><div style=3D"font-fam=
ily:menlo, consolas, monospace;">I have an external C/C++ toolchain that=
 I've put together that uses MUSL. I've also built an external Rust tool=
chain that uses my MUSL toolchain. <br></div><div style=3D"font-family:m=
enlo, consolas, monospace;"><br></div><div style=3D"font-family:menlo, c=
onsolas, monospace;">My issue is that there is a Rust Kconfig variable t=
hat specifies if a specific architecture supports Rust. <br></div><div s=
tyle=3D"font-family:menlo, consolas, monospace;"><br></div><div style=3D=
"font-family:menlo, consolas, monospace;">The Kconfig variable in questi=
on is BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS in package/rustc/Confi=
g.in.host. <br></div><div style=3D"font-family:menlo, consolas, monospac=
e;"><br></div><div style=3D"font-family:menlo, consolas, monospace;">In =
my br2 external project I have the following setup: <br></div><div style=
=3D"font-family:menlo, consolas, monospace;"><br></div><div style=3D"fon=
t-family:menlo, consolas, monospace;"><br></div><div style=3D"font-famil=
y:menlo, consolas, monospace;"><br></div><div style=3D"font-family:menlo=
, consolas, monospace;">My issue is that I can't seem to override the BR=
2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS, which masks all other Rust pa=
ckages. <br></div><div style=3D"font-family:menlo, consolas, monospace;"=
><br></div><div style=3D"font-family:menlo, consolas, monospace;">.<br><=
/div><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=9C=E2=
=94=80=E2=94=80 external.desc<br></div><div style=3D"font-family:menlo, =
consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |nam=
e: MINE<br></div><div style=3D"font-family:menlo, consolas, monospace;">=
=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |desc: My BR2 External<br>=
</div><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `----<br></div><div style=3D"font-fam=
ily:menlo, consolas, monospace;">=E2=94=9C=E2=94=80=E2=94=80 external.mk=
<br></div><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |include $(sort $(wildcard $(BR2_EX=
TERNAL_MINE_PATH)/package/*/*.mk))<br></div><div style=3D"font-family:me=
nlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |include $(sort $(wildcard $(BR2_EXTERNAL_MINE_PATH)/toolchain/*/*.mk))=
<br></div><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `----<br></div><div style=3D"font-f=
amily:menlo, consolas, monospace;">=E2=94=9C=E2=94=80=E2=94=80 Config.in=
<br></div><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | source "$BR2_EXTERNAL_MINE_PATH/t=
oolchain/my-external/Config.in.options"<br></div><div style=3D"font-fami=
ly:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; | source "$BR2_EXTERNAL_MINE_PATH/package/rpkg/Config.in"<br></div=
><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `----<br></div><div style=3D"font-family:m=
enlo, consolas, monospace;">=E2=94=9C=E2=94=80=E2=94=80 configs<br></div=
><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&=
nbsp; =E2=94=9C=E2=94=80=E2=94=80 my_gnu_defconfig<br></div><div style=3D=
"font-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp; =E2=94=94=
=E2=94=80=E2=94=80 my_musl_defconfig<br></div><div style=3D"font-family:=
menlo, consolas, monospace;">|<br></div><div style=3D"font-family:menlo,=
 consolas, monospace;">=E2=94=9C=E2=94=80=E2=94=80 package<br></div><div=
 style=3D"font-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;=
 =E2=94=94=E2=94=80=E2=94=80 rpkg<br></div><div style=3D"font-family:men=
lo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=E2=94=9C=E2=94=80=E2=94=80 Config.in<br></div><div style=3D"font-family=
:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =E2=94=94=E2=94=80=E2=94=80 rpkg.mk<br></div><div style=3D"font-fami=
ly:menlo, consolas, monospace;">=E2=94=9C=E2=94=80=E2=94=80 provides<br>=
</div><div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82&n=
bsp;&nbsp; =E2=94=94=E2=94=80=E2=94=80 toolchains.in<br></div><div style=
=3D"font-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | config BR2_TOOLCHAIN_EXTERNAL_MY_=
MUSL<br></div><div style=3D"font-family:menlo, consolas, monospace;">=E2=
=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	bool "My=
 PowerPC MUSL Toolchain"<br></div><div style=3D"font-family:menlo, conso=
las, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 	depends on BR2_powerpc<br></div><div style=3D"font-family:me=
nlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; |<br></div><div style=3D"font-family:menlo, consolas,=
 monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | config BR2_TOOLCHAIN_EXTERNAL_MY_GNU<br></div><div style=3D"font-=
family:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 	bool "My PowerPC GNU Toolchain"<br></div>=
<div style=3D"font-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; depends on BR2_powerpc<br></div><div style=3D"f=
ont-family:menlo, consolas, monospace;">=E2=94=82&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `----<br></div><div style=3D"font-family=
:menlo, consolas, monospace;">=E2=94=94=E2=94=80=E2=94=80 toolchain<br><=
/div><div style=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;=
&nbsp; =E2=94=94=E2=94=80=E2=94=80 my-external<br></div><div style=3D"fo=
nt-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =E2=94=94=E2=94=80=E2=94=80 Config.in.options<br></div><div st=
yle=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | if =
BR2_TOOLCHAIN_EXTERNAL_MY_MUSL<br></div><div style=3D"font-family:menlo,=
 consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | config BR2_TOOLCHAIN_EXTERNA=
L_PREFIX<br></div><div style=3D"font-family:menlo, consolas, monospace;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 	default "powerpc-my-linux-musl"<br></div><div sty=
le=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | conf=
ig BR2_TOOLCHAIN_EXTERNAL_PATH<br></div><div style=3D"font-family:menlo,=
 consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default "${WORKSPACE_DIR}/t=
oolchain/powerpc-my-linux-musl"<br></div><div style=3D"font-family:menlo=
, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br></div><div style=3D"font=
-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | config BR2_PAC=
KAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS<br></div><div style=3D"font-family:=
menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	bool<br></div><div st=
yle=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	de=
fault y if BR2_i386<br></div><div style=3D"font-family:menlo, consolas, =
monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default y if BR2_x86_64<br></div><div =
style=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	=
default y if BR2_aarch64<br></div><div style=3D"font-family:menlo, conso=
las, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default y if BR2_arm &amp;&amp; !=
BR2_ARM_CPU_ARMV4 &amp;&amp; !BR2_ARM_CPU_ARMV5 \<br></div><div style=3D=
"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !(BR2_ARM_CPU_ARMV7A &amp;=
&amp; BR2_ARM_EABI)<br></div><div style=3D"font-family:menlo, consolas, =
monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default y if BR2_powerpc || BR2_powerp=
c64 || BR2_powerpc64le<br></div><div style=3D"font-family:menlo, consola=
s, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default y if (BR2_mips || BR2_mipse=
l) &amp;&amp; !BR2_MIPS_CPU_MIPS32R6<br></div><div style=3D"font-family:=
menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default y if (BR2_mip=
s64 || BR2_mips64el) &amp;&amp; !BR2_MIPS_CPU_MIPS64R6 \<br></div><div s=
tyle=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 		=
&amp;&amp; BR2_MIPS_NABI64<br></div><div style=3D"font-family:menlo, con=
solas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	depends on (BR2_TOOLCHAIN_USES_=
GLIBC || BR2_TOOLCHAIN_USES_MUSL)<br></div><div style=3D"font-family:men=
lo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	depends on BR2_PACKAGE_H=
OST_RUSTC_ARCH_SUPPORTS<br></div><div style=3D"font-family:menlo, consol=
as, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br></div><div style=3D"font-family:=
menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | endif<br></div><div st=
yle=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>=
</div><div style=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | if BR2_TOOLCHAIN_EXTERNAL_MY_GNU<br></div><div style=3D"font-f=
amily:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | config BR2_TOOLC=
HAIN_EXTERNAL_PREFIX<br></div><div style=3D"font-family:menlo, consolas,=
 monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default "powerpc-my-linux-gnu"<br></d=
iv><div style=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | config BR2_TOOLCHAIN_EXTERNAL_PATH<br></div><div style=3D"font-fa=
mily:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 	default "${WORKS=
PACE_DIR}/toolchain/powerpc-my-linux-gnu"<br></div><div style=3D"font-fa=
mily:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | endif<br></div><d=
iv style=3D"font-family:menlo, consolas, monospace;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
`----<br></div><div style=3D"font-family:menlo, consolas, monospace;"><b=
r></div><div style=3D"font-family:menlo, consolas, monospace;">You may n=
otice that I changed the libc depends line to be or'd with BR2_TOOLCHAIN=
_USES_MUSL. It seems that this does not get considered when I choose my =
external musl toolchain option. In the menuconfig when I search for the =
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS variable with the "/" key it=
 looks like it is only getting it from the original file. Does buildroot=
 have a mechanism for overwriting this kind of setting and if not, does =
anyone have an idea of how I would accomplish what I am trying to do (ma=
ke buildroot honor my external rust toolchain)?<br></div><div style=3D"f=
ont-family:menlo, consolas, monospace;"><br></div><div style=3D"font-fam=
ily:menlo, consolas, monospace;">Thanks, <br></div><div style=3D"font-fa=
mily:menlo, consolas, monospace;">Jesse<br></div></body></html>
--ee66280776d64463b8b760ef47dbd890--

--===============0274290102671465667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0274290102671465667==--
