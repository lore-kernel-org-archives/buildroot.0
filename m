From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Mar 2020 19:12:42 +0200
Subject: [Buildroot] [PATCH 1/5] package/gvfs: fix CVE-2019-3827
In-Reply-To: <20200329164916.GH22325@scaer>
References: <20200329160246.4053834-1-fontaine.fabrice@gmail.com>
 <20200329164916.GH22325@scaer>
Message-ID: <CAPi7W83=ZELwxEACGYeC7UhiOAhNWZjZp-8tCpZTEWc+0YoSwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Le dim. 29 mars 2020 ? 18:49, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2020-03-29 18:02 +0200, Fabrice Fontaine spake thusly:
> > An incorrect permission check in the admin backend in gvfs before
> > version 1.39.4 was found that allows reading and modify arbitrary files
> > by privileged users without asking for password when no authentication
> > agent is running. This vulnerability can be exploited by malicious
> > programs running under privileges of users belonging to the wheel group
> > to further escalate its privileges by modifying system files without
> > user's knowledge. Successful exploitation requires uncommon system
> > configuration.
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Patch series applied to master, thanks.
>
> Any reason why you sent one patch for each CVE, rather than a single
> patch?
No special reason, I thought that it'll be easier to review one by one
instead of a single patch.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  ...authentication-agent-isn-t-available.patch | 46 +++++++++++++++++++
> >  package/gvfs/gvfs.mk                          |  3 ++
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
> >
> > diff --git a/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch b/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
> > new file mode 100644
> > index 0000000000..2715371534
> > --- /dev/null
> > +++ b/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
> > @@ -0,0 +1,46 @@
> > +From d8d0c8c40049cfd824b2b90d0cd47914052b9811 Mon Sep 17 00:00:00 2001
> > +From: Ondrej Holy <oholy@redhat.com>
> > +Date: Wed, 2 Jan 2019 17:13:27 +0100
> > +Subject: [PATCH] admin: Prevent access if any authentication agent isn't
> > + available
> > +
> > +The backend currently allows to access and modify files without prompting
> > +for password if any polkit authentication agent isn't available. This seems
> > +isn't usually problem, because polkit agents are integral parts of
> > +graphical environments / linux distributions. The agents can't be simply
> > +disabled without root permissions and are automatically respawned. However,
> > +this might be a problem in some non-standard cases.
> > +
> > +This affects only users which belong to wheel group (i.e. those who are
> > +already allowed to use sudo). It doesn't allow privilege escalation for
> > +users, who don't belong to that group.
> > +
> > +Let's return permission denied error also when the subject can't be
> > +authorized by any polkit agent to prevent this behavior.
> > +
> > +Closes: https://gitlab.gnome.org/GNOME/gvfs/issues/355
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Retrieved from:
> > +https://gitlab.gnome.org/GNOME/gvfs/commit/d8d0c8c40049cfd824b2b90d0cd47914052b9811]
> > +---
> > + daemon/gvfsbackendadmin.c | 3 +--
> > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > +
> > +diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
> > +index ec0f2392..0f849008 100644
> > +--- a/daemon/gvfsbackendadmin.c
> > ++++ b/daemon/gvfsbackendadmin.c
> > +@@ -130,8 +130,7 @@ check_permission (GVfsBackendAdmin *self,
> > +       return FALSE;
> > +     }
> > +
> > +-  is_authorized = polkit_authorization_result_get_is_authorized (result) ||
> > +-    polkit_authorization_result_get_is_challenge (result);
> > ++  is_authorized = polkit_authorization_result_get_is_authorized (result);
> > +
> > +   g_object_unref (result);
> > +
> > +--
> > +2.24.1
> > +
> > diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
> > index c380a710fb..6c927fa345 100644
> > --- a/package/gvfs/gvfs.mk
> > +++ b/package/gvfs/gvfs.mk
> > @@ -15,6 +15,9 @@ GVFS_LICENSE = LGPL-2.0+
> >  GVFS_LICENSE_FILES = COPYING
> >  GVFS_LIBS = $(TARGET_NLS_LIBS)
> >
> > +# 0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
> > +GVFS_IGNORE_CVES += CVE-2019-3827
> > +
> >  # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
> >  # build system from searching the host paths.
> >  GVFS_CONF_ENV = \
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
