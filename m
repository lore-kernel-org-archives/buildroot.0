From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Jan 2013 23:18:39 +0100
Subject: [Buildroot] [RFC v1 05/14] autotools infrastructure: do the
 autoreconf as a post patch step
In-Reply-To: <20130127172748.29a8d6cf@skate>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <510452A9.4050805@mind.be> <20130127172748.29a8d6cf@skate>
Message-ID: <5105A7BF.4080701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/13 17:27, Thomas Petazzoni wrote:
> One reason that might explain this is the lack of ordering guarantees
> on post patch hooks. For example, if you have a post patch hook that
> applies Debian patches, and a post patch hook to do the autoreconf, you
> quite certainly want the Debian patches hook to be executed before the
> autoreconf hook. But I have absolutely no idea if this is the problem
> that we were trying to fix here.

  That sounds like a likely explanation...


> That said, I still believe that the autoreconf thing belongs to the
> patch step. It is really a modification of the source code itself, and
> it is common to both the target build and host build.

  I completely agree.


> So maybe the
> autotools infrastructure needs a special hook in the generic
> infrastructure (rather than a normal post patch hook), to ensure that
> the autoreconf step gets executed after all post patch hooks?

  Or maybe (just thinking out loud here) there could be the possibility 
for the package infrastructure to add additional steps in the dependency 
chain. Something like

ifeq ($$($(2)_AUTORECONF),YES)
$(2)_TARGET_AUTORECONFIGURE = $$($(3)_SRCDIR)/.stamp_autoreconfigured
$(1)-autoreconfigure: $(1)-patch $$($(2)_TARGET_AUTORECONFIGURE)
$(1)-configure: $(1)-autoreconfigure
endif


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
