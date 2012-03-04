From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 14:22:15 +0100
Subject: [Buildroot] [PATCH v2 3/3] Add test infrastructure
In-Reply-To: <1330866196-5360-3-git-send-email-arnout@mind.be>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
 <1330866196-5360-3-git-send-email-arnout@mind.be>
Message-ID: <201203041422.15542.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 14:03:16 Arnout Vandecappelle (Essensium/Mind) wrote:
> +       cp "${baseconfigfile}" "${configdir}/.config.in"
> +       printf 'BR2_HOST_DIR="%s"\n' "${hostdir}" >> "${configdir}/.config.in"

 The purpose of this non-default hostdir was to be able to reuse the
toolchain for several tests.  That doesn't work the way it's done now,
of course - it will still be rebuilt.

 What I would need to do is:
1. build the toolchain using this config
2. change the config to use the external toolchain in ${hostdir}
3. run randpackageconfig
4. build with that randpackageconfig

 I'm not sure how to do steps 1 and 2, though.

 For step 1, I don't think there is a target for building the
toolchain, is there?  For the internal toolchain it's a long list of
targets, for an external or crosstool-NG toolchain it's 'uclibc'.

 For step 2, how can I reliably change the config file to reflect the
external toolchain?  I'd need to remove a lot of symbols but also add
the external toolchain configuration options...  Maybe we should create
a piece of .config that sets all this when an internal or crosstool-NG
toolchain is built?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
