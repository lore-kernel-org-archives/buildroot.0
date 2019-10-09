From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Oct 2019 17:53:25 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <20191009153454.1f5f3e09@windsurf>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
 <20191009141235.016e4b23@windsurf>
 <CAEyMn7a2w8vXSqHHmHtKmkn8okGVdOq=XSsbRaYtG_bOJ6T0hA@mail.gmail.com>
 <20191009153454.1f5f3e09@windsurf>
Message-ID: <20191009155325.GU10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Heiko, All,

On 2019-10-09 15:34 +0200, Thomas Petazzoni spake thusly:
> On Wed, 9 Oct 2019 15:14:15 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
> > > > +NETOPEER2_KEYSTORED_LICENSE = BSD-3-Clause
> > > > +NETOPEER2_KEYSTORED_LICENSE_FILES = LICENSE
> > > > +NETOPEER2_KEYSTORED_SUBDIR = keystored
> > > > +NETOPEER2_KEYSTORED_DEPENDENCIES += host-sysrepo sysrepo  
> > 
> > So I have to move all the stuff from the 3 packages (netopeer2-server,
> > netopeer2-cli, netopeer2-keystored) into one package e.g. netopeer2.
> 
> Yes.
> 
> > Is it possible to have there 3 different build targets depending on
> > the configuration?
> 
> It depends on what you call build targets. Looking at the netooper2
> code base, it's indeed 3 separate projects together, each with its own
> CMake build system. I.e, there is no top-level CMakeLists.txt to build
> the different components.

... yet they share the same set of top-level cmake modules... :-/

Which is not clean, because those CMakeModules should be provided by the
libs themselves (e.g. libyang should provide FindLibYANG.cmake)...

> So we would have to do the CMake configuration/build/install steps
> manually, as the cmake-package infrastructure only deals with a single
> top-level CMake build infrastructure, which netopeer2 doesn't have.
> 
> In the light of this in the end, perhaps it makes sense to have three
> packages like you did. It kind of reflects the fact that even though
> they are stored in the same Git repo, they are three independent
> components each with its own build system.

Yes.

And since they do share the same source tree, we really want to download
it only once:

    NETOPEER2_KEYSTORED_DL_SUBDIR = netopeer2

(similarly for the other two packages, of course).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
