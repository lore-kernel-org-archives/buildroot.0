From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 15 Apr 2020 23:41:41 -0300
Subject: [Buildroot] [PATCH/next v2 3/4] package/openrc: add libselinux
 support
In-Reply-To: <20200311173542.GO5357@scaer>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-4-unixmania@gmail.com>
 <20200311172623.GN5357@scaer> <20200311173542.GO5357@scaer>
Message-ID: <CAJ4jsad14atp9dpwsmZDPVrOCO27ep5D_3BohS8E=7ap0e_OXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 11, 2020 at 2:35 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> CArlos, Adam, All,
>
> On 2020-03-11 18:26 +0100, Yann E. MORIN spake thusly:
> > On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> > > From: Adam Duskett <Aduskett@gmail.com>
> > > If the libselinux package is selected, add the package to the dependency list
> > > and explicitly set OPENRC_MAKE_OPTS += MKSELINUX=yes
> >
> > This SELinux stuff has always been a bit boo-I-dont-want-too-touch for
> > me, because it looks overly complex, so just adding the dependency
> > without explanations on how openrc uses/fits with SELinux is a bit too
> > much for me to handle, so I defer to a SELinux-knowledgeable maintainer
> > to look a it...
>
> WHAT I forgot to say above the current commit log, is that it is not
> that helpful: it just repeats in english what the patch does, which is
> anyway already pretty trivial to see... What a commit log should say, is
> why the patch exists, and how the patch works.
>
> Totally hypotetical commit log:
>
>     package/openrc: add libselinux support
>
>     OpenRC has suport for SELinux contexts, but we currently forcibly
>     disable it.

OK, I will send a new patch with a better commit message and explained
how I tested it.

>     When SELinux is enabled, we know a policy will be installed, so we
>     can enable SELinux support in OpenRC.

Actually no policy is installed along with OpenRC. Enabling SELinux in
OpenRC only adds code to perform the initial policy load and set the
enforcing mode. See the security_load_policy(3) man page for
additional details.

In order to make the SELinux support useful you also need a complete
policy, currently provided by the refpolicy package, as well as the
policycoreutils (for restorecon and other utilities). I'm not sure if
those packages should be selected along with openrc (they are not
selected by systemd, for instance).

As explained in the package help, the refpolicy works for the most
part in permissive mode, only.

-- 
Carlos Santos <unixmania@gmail.com>
