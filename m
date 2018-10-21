From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 21 Oct 2018 17:18:22 +0100
Subject: [Buildroot] [PATCH 1/1] utils/diffconfig: Removed BR2_* prefix
 restriction
In-Reply-To: <20180920114416.13976-1-m.patzlaff@pilz.de>
References: <20180920114416.13976-1-m.patzlaff@pilz.de>
Message-ID: <73c4c6cf-b3a3-cacc-d946-a0be5427750b@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcel,

On 20/09/18 13:44, Marcel Patzlaff wrote:
> This patch removes the prefix restrictions on items in config files to
> compare and now allows any prefix to be used.
> 
> Motivation:
> To the best of my knowledge, buildroot does not impose any restrictions
> on how to name config items. It is perfectly fine to use arbitrary
> prefixes in your extensions. This kind of freedom should be reflected
> in the accompanying tools so that's why I propose this patch.

Well, the BR2_ prefix is required as a policy. Unfortunately this is not
written in the manual, but rather done during patch review. Thus this
does not look like a real motivation.

> As a side effect, this script now is able to correctly compare configs
> of kconfig based packages as well as of buildroot itself.

This is a valid motivation instead!

Since there is a valid motivation, and the patch is not adding
complexity, I'm OK with it. But I'd rewrite the comment as:

-----------------8<-------------------

The utils/diffconfig script works only on variables with the BR2_
prefix. This is OK for Buildroot [def]configs since this is the prefix
for all user-facing variables, but it prevents using the same script to
compare configs from kconfig-based packages.

Remove the BR2_ restriction, allowing usage such as:

./utils/diffconfig \
	board/qemu/xtensa-lx60/linux.config \
	board/qemu/xtensa-lx60/linux-nommu.config

-----------------8<-------------------

I'm sending v2 with the above change.

-- 
Luca
