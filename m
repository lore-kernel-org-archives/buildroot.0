From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Dec 2018 09:49:02 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <CADvTj4r=OkPbwSyN2ZUmFxraHQYp07ciW700574-ZD2Xzjqihw@mail.gmail.com>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <20181226222329.18046c1c@windsurf> <20181226214100.GK14286@scaer>
 <CADvTj4rPZqjx_iNHF7Q8DKa63P+OOX=v-YuhCfUZMR4VOa-zsw@mail.gmail.com>
 <CADvTj4ognr24o+CU-gBsCkH2K=KqbwAtrNv2Vv+9L_97HFUQhg@mail.gmail.com>
 <CADvTj4pMMmcwaij-ApcgHQB0ZSAyh3vQHQ_VEb-rQGtraxHuwA@mail.gmail.com>
 <CADvTj4r=OkPbwSyN2ZUmFxraHQYp07ciW700574-ZD2Xzjqihw@mail.gmail.com>
Message-ID: <20181227084902.GN14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-26 19:27 -0600, James Hilliard spake thusly:
> On Wed, Dec 26, 2018 at 4:52 PM James Hilliard
> > > > meson.build:293:8: ERROR:  Unknown compiler(s):
> > > > [['/home/buildroot/buildroot/output/host/bin/i586-buildroot-linux-uclibc-g++']]
> > Upstream bug report https://github.com/systemd/systemd/issues/11278
> Potential fix: https://github.com/systemd/systemd/pull/11279

That unfortunately does not work:

ERROR: No specified compiler can handle file src/libsystemd/sd-bus/test-bus-vtable-cc.cc

But if you also add:

    diff --git a/src/test/meson.build b/src/test/meson.build
    index ea049a6fb..d9d87e02c 100644
    --- a/src/test/meson.build
    +++ b/src/test/meson.build
    @@ -957,7 +957,7 @@ tests += [
     
     ]
     
    -if cxx.found()
    +if cxx_cmd != ''
             tests += [
                     [['src/libsystemd/sd-bus/test-bus-vtable-cc.cc'],
                      [],

Then it works.

Obviously, I'm not sure this is the right fix...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
