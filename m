From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jul 2017 00:18:19 +0200
Subject: [Buildroot] [PATCH 19/20] system: make systemd work on a
 read-only rootfs
In-Reply-To: <c74e8ad5fca764a23b9392af5cb83ecefb4a5817.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <c74e8ad5fca764a23b9392af5cb83ecefb4a5817.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <f137feaf-3cb1-4a9a-0331-d51bca014f50@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
[snip]
> With a line like:
> 
>     C /var/something - - - -
> 
> it will look for /usr/share/factory/something and copy it (recursively
> if it is a directory) to /var/something, but only if it does not already
> exist there.

 So we could just have a line

C /var - - - -

and be done with it?

[snip]
> Note that we treat symlinks a little bit specially, by creating symlinks
> to the factory defaults rather than copying them.

 You forgot to explain why. I guess because a relative symlink that was created
based on the /usr/share/factory location wouldn't work any more.

 However, it is possible that a package creates a relative symlink based on the
/var location. Most symlinks that we create in Buildroot stupidly assume that
all the path components are not symlinks. So a package could for example do

ln -sf ../srv/www $DESTDIR/var/www

This will now create a broken symlink. It's fine as long as it is copied as-is
to /var, but not with your approach...

[snip]
> +define SKELETON_SYSTEMD_ROOT_RO_OR_RW
> +	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
> +	mkdir -p $(TARGET_DIR)/usr/share/factory
> +	ln -s usr/share/factory $(TARGET_DIR)/var

 Since other stuff may also want to put things in /usr/share/factory, I think it
should be
	mkdir -p $(TARGET_DIR)/usr/share/factory/var
	ln -s usr/share/factory/var $(TARGET_DIR)/var

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
