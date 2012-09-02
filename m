From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 02 Sep 2012 22:30:48 +0200
Subject: [Buildroot] [PATCH 10/12] pkg-infra: ensure gettext gets built
 before all other packages
In-Reply-To: <1346600635-30946-11-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
 <1346600635-30946-11-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5043C1F8.6020801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/12 17:43, Yann E. MORIN wrote:
> If the gettext package is selected, it means that the toolchain does not
> provide gettext functionality, and that at least one package needs it.
> Thus, the gettext package needs to be built before any such package.
>
> So far, packages that need gettext declare an explicit conditional
> build-dependency upon gettext, thus ensuring that gettext be built
> before they are.
>
> But if gettext was built first, packages would no longer need to declare
> such an explicit build-dependency.
>
> As it is not easy to ensure that gettext be the first package, we can also
> declare it as a dependency of all packages (except itself, of course).


  I don't like this.  I don't like the idea of having redundant dependencies,
I don't like to have a single thing that everything depends on, I don't like
the $(filter-out ...) construct.

  I also don't like that it breaks the build when the toolchain depends on some
package (sstrip, ccache, ...).

  Possible alternatives:

  * Use a construct similar to patch 11/12: $(gettext-dependency) which is
nothing unless gettext is enabled.

  * Move this dependency into the toolchain logic - which means duplicating
it three times so maybe not such a good idea...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
