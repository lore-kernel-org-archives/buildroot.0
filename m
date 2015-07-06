From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jul 2015 00:03:58 +0200
Subject: [Buildroot] [PATCH v5 2/2] pkg-luarocks: fix top-level parallel
 makefile support
In-Reply-To: <20150704152639.1c1cc720@free-electrons.com>
References: <1435738247-9015-1-git-send-email-fabio.porcedda@gmail.com>
 <1435738247-9015-3-git-send-email-fabio.porcedda@gmail.com>
 <20150704152639.1c1cc720@free-electrons.com>
Message-ID: <559AFB4E.9090101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/15 15:26, Thomas Petazzoni wrote:
> However, won't we see some similar issues with other packages? Should
> we preventively do a flock on HOST_DIR/STAGING_DIR/TARGET_DIR when
> installing to host/staging/target respectively, so that we are sure
> that at any given time, we don't have two packages installing at the
> same time in one of the directories? Theoretically, this shouldn't be
> needed if all packages install their own files, or if they have the
> proper dependencies when they are overwriting files from another
> package.

 There aren't many packages that would have this problem, but indeed a few. E.g.
packages installing kernel modules will typically call depmod. So yes, it would
be a good idea to do that in general.

 However, how are you going to do that in practice? flock works like fakeroot,
you have to run the commands from within the process. But all our INSTALL_*_CMDS
are supposed to be called as separate shell scripts.

 So we'd have to use something like dotlockfile, but I don't think we can assume
that's installed everywhere, can we? Or else we have to devise something similar
around flock.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
