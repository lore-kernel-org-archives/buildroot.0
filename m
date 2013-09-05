From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Sep 2013 18:46:22 +0200
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>	<1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
 <20130905094446.3f139253@skate>
 <OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
Message-ID: <5228B55E.2090505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/13 14:58, clshotwe at rockwellcollins.com wrote:
>  > > +define HOST_LIBSEPOL_INSTALL_CMDS
>  > > +   $(MAKE) -C $(@D) install $(HOST_LIBSEPOL_MAKE_CMDS)
> DESTDIR=$(HOST_DIR)
>  > > +   mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
>  > > +   (cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.
>  > 1 libsepol.so)
>  > > +   -rmdir $(HOST_DIR)/lib
>  >
>  > So I guess the problem here is that the library gets installed in /lib
>  > while you wanted it in /usr/lib. It's not very pretty but maybe you can
>  > cheat by passing DESTDIR=$(HOST_DIR)/usr.
>
> Oh I wish these packages followed standard conventions.  They are
> purposefully
> installing the library in /lib and symlinking to it from /usr/lib. This
> little
> hack was created to correct this to match what most other packages do.

  I don't think it's really necessary to do this move just because it 
looks nicer. I think it's better to stay with upstream. Although this 
would be the first package to install anything in $(HOST_DIR)/lib, we 
anyway already have

HOST_LDFLAGS  += -L$(HOST_DIR)/lib ...

  We don't have an rpath for it, though, so maybe that should be added.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
