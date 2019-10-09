From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Oct 2019 20:15:53 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <CAEyMn7YJKRYb_NLOgCpM=2tZ+jRHdtTB9g7xPpgGwRt400rtxw@mail.gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
 <20191009141235.016e4b23@windsurf>
 <CAEyMn7a2w8vXSqHHmHtKmkn8okGVdOq=XSsbRaYtG_bOJ6T0hA@mail.gmail.com>
 <20191009153454.1f5f3e09@windsurf> <20191009155325.GU10860@scaer>
 <CAEyMn7YagOvss5TYDpZUvctz1xAiw=A72MZjj+Tw9gvjm9h35A@mail.gmail.com>
 <CAEyMn7YJKRYb_NLOgCpM=2tZ+jRHdtTB9g7xPpgGwRt400rtxw@mail.gmail.com>
Message-ID: <20191009181553.GV10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-10-09 19:08 +0200, Heiko Thiery spake thusly:
> > Hi Yann,
> >
> > > > So we would have to do the CMake configuration/build/install steps
> > > > manually, as the cmake-package infrastructure only deals with a single
> > > > top-level CMake build infrastructure, which netopeer2 doesn't have.
> > > >
> > > > In the light of this in the end, perhaps it makes sense to have three
> > > > packages like you did. It kind of reflects the fact that even though
> > > > they are stored in the same Git repo, they are three independent
> > > > components each with its own build system.
> > >
> > > Yes.
> > >
> > > And since they do share the same source tree, we really want to download
> > > it only once:
> > >
> > >     NETOPEER2_KEYSTORED_DL_SUBDIR = netopeer2
> > >
> > > (similarly for the other two packages, of course).
> >
> > does this mean we still have 3 packages but 2 of them use the download
> > of e.g. netopeer2-server as the "master" package?
> 
> should I add the 2 other packages into a subfolder under
> netopeer2-server like it is done for the fftw package and the
> corresponding subpackages?

You should keep doing three packages, like you initially submitted:

    package/netopeer2-keystored/Config.in
    package/netopeer2-keystored/netopeer2-keystored.mk
    package/netopeer2-keystored/netopeer2-keystored.hash
    package/netopeer2-server/Config.in
    package/netopeer2-server/netopeer2-server.mk
    package/netopeer2-server/netopeer2-server.hash
    package/netopeer2-cli/Config.in
    package/netopeer2-cli/netopeer2-cli.hash
    package/netopeer2-cli/netopeer2-cli.mk

Then, you should add in the corresponding files:

    NETOPEER2_KEYSTORED_DL_SUBDIR = netopeer2
    NETOPEER2_SERVER_DL_SUBDIR = netopeer2
    NETOPEER2_CLI_DL_SUBDIR = netopeer2

That all three of them have the same _DL_SUBDIR means that the archive
will be downloaded only once, and be used for all three packages (but
this _DL_SUBDIR variable is indeed not documented in our manual).

See for example: mesa3d and mesa3d-headers, or bluez5_utils and
bluez5_utils-headers, for an example of using _DL_SUBDIR.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
