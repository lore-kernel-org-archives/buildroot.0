From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Feb 2016 00:33:23 +0100
Subject: [Buildroot] copy-package infrastructure [was: Re: [PATCH 1/1] new
 package: jsen]
In-Reply-To: <20160216222540.64878554@free-electrons.com>
References: <1455605293-1869-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <20160216222540.64878554@free-electrons.com>
Message-ID: <56C3B1C3.7060807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-02-16 22:25, Thomas Petazzoni wrote:
> define JSEN_INSTALL_TARGET_CMDS
> 	mkdir -p $(TARGET_DIR)/usr/share/jsen
> 	$(foreach d,dist lib index.js,\
> 		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/jsen/$(sep))
> endef
> 
> As a side note, I am wondering if we shouldn't create some common
> infrastructure to simplify all those packages that just need to "copy"
> stuff. Either a special variable in the generic-package infrastructure,
> or a separate "copy-package" infrastructure that provides a special
> variable that allows the package to list "stuff to be copied" and
> another listing "where to copy". But that's clearly beyond the scope of
> your patch, so don't worry about this.


 It fairly often happens that other stuff is needed as well, so the copy-package
infrastructure doesn't sound like a good idea. A variable is also not so simple,
because you need to specify the source and the target directories.

 So I think it should be a function, like

define JSEN_INSTALL_TARGET_CMDS
	$(call copy-dirs,dist lib index js,/usr/share/jsen)
endef

 However, I think it's not really worth it. We're saving just a little bit of
code, and hiding what's really happening. I prefer to keep things explicit.

 BTW in the same vein, we should also get rid of the github helper. It was
introduced because the github URLs were changing all the time, but that's no
longer the case now.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
