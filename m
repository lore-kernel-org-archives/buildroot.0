From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 21:12:53 +0100
Subject: [Buildroot] [RFC v1] Prototype implementation of per-package
 out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <510195C5.1050403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 00:52, Thomas Petazzoni wrote:
[snip]
>   * The semantic of the 'make <pkg>-dirclean' command. Should it remove
>     the build directory and the source directory? Only the build
>     directory? If it removes both (which the proposed prototype
>     currently does), it is strange because you remove one build variant
>     (host or target) and the source directory, but the other build
>     variant (target or host) remains.

  I think the typical usecase for <pkg>-dirclean is when the patches have 
changed. So clearly the source should be removed as well. As mentioned by 
Stephan, Ideally the host-<pkg> build dir should be removed as well, but 
I think this is not that important because the newly patched files will 
have a more recent timestamp so the corresponding host-binaries should be 
rebuilt automatically.


>   * I am not sure on how we want to handle <pkg>-reconfigure and
>     <pkg>-rebuild. I guess we want to tell the user to do his changes
>     in the package source directory, output/src/<pkg>-<version>. But
>     all files in this source directory are marked read-only, so it's
>     not very practical.

  First of all, <pkg>-re{configure,build} is often used with 
OVERRIDE_SRCDIR so there you don't have a problem.

  If people do edit directly in the output/src directory, I think it is 
_very_ good that they have to 'chmod +w' first, as a reminder that 
editing in output/src is a bit risky. And once you've chmod'ed it, it 
stays writable because the chmod a-w is done at the end of the patch step.

  So I don't think there's an issue for <pkg>-re{configure,build}.


>     In addition to this, for packages that don't support out of tree
>     build, we do a rsync at the beginning of the configure step. So if
>     the user does "make <pkg>-reconfigure", then the source code gets
>     rsynced again from the source directory to the build directory, but
>     not if the user does "make <pkg>-rebuild".

  That's not so good. It could be solved by using the same mechanism that 
is currently used by OVERRIDE_SRCDIR: add an intermediate <pkg>-rsync 
target and stamp file, and remove the stamp file in 
<pkg>-clean-for-re{configure,build}.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
