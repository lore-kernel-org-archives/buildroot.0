From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 11:34:48 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <55EFFD38.5010104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 23:28, Luca Ceresoli wrote:
> First, we need the BR2_ROOTFS_STATIC_DEVICE_TABLE just like the static
> /dev management, in order to have the very basic devices such as /dev/null
> and /dev/console until mdev is enabled.

 Actually, I don't think this is a good idea: we're asking the user to configure
a static device table which is not going to be used anyway.

 I think it's better to move /dev/null and /dev/console to device_table.txt -
i.e., include them in every rootfs. It just increases the size with a few
hundred bytes, it doesn't hurt because devtmpfs is normally automounted over it
right away, and it is better for the cpio/initramfs case because you won't get
the 'Unable to open initial console' message anymore (I think). Plus, the
redirects can be removed from fs/cpio/init since they'll be automatic.

 What do the other developers think?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
