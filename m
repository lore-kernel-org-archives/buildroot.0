From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 23:22:56 +0100
Subject: [Buildroot] [RFC/PATCH] fs/common.mk: Fix wrong double dollar
 usage
In-Reply-To: <CAAXf6LUevRWy7hgHh2rrL9BVq2A95W=MAh8wCd8cZCy_c0A_sg@mail.gmail.com>
References: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAAXf6LXzA2qSxq+5XRzRQUrXTHhTwYg2VA9GdTiNpPzkcNndxQ@mail.gmail.com>
 <20130312100611.GD2506@localhost>
 <CAAXf6LUevRWy7hgHh2rrL9BVq2A95W=MAh8wCd8cZCy_c0A_sg@mail.gmail.com>
Message-ID: <513FAAC0.3050100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 12:28, Thomas De Schampheleire wrote:
> The main problem is that the 'ifneq' never evaluates to false, as you
> mentioned, even if its contents are 'empty'. They are never really
> empty, because of this line:
>
> ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
>          $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>
> Because it is a concatenation of two strings separated by spaces,
> there will always be a space in the final variable, which means it's
> not empty. We need to strip it.
> The following change fixes your problem, it runs the qstrip on the
> overal combination of the variables, causing the space to be removed
> if it's the only thing left.

  Alternatively, you could remove the space before the backslash. But I 
think I prefer the overall qstrip.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
