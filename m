From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Jan 2019 06:59:17 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <6c1edf5d-e6b3-9453-96a3-4f7aa9480a44@mind.be>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <6c1edf5d-e6b3-9453-96a3-4f7aa9480a44@mind.be>
Message-ID: <20190111055917.GC2428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-01-11 00:47 +0100, Arnout Vandecappelle spake thusly:
> On 26/12/2018 09:52, Yann E. MORIN wrote:
> > Since systemd-boot is really part of systemd, when systemd is enabled
> > (as an init system), we rely on it to build the boot blobs, and
> > systemd-boot (this package) is not available.
> > 
> > Now, when systemd is not enabled, systemd-boot (this package) will
> > actually build the boot blobs, and only that. No userspace tool is
> > built.
>  I really don't like this approach of copying systemd.
> 
>  I would instead try harder to keep the standalone version part of the systemd
> package itself. Yes, I realize that I'm coming very late with this... The only
> reason we got here is this statement from Yann:
> 
> >> What is wrong is that it makes the systemd package *and* the init
> >> selectionmuch more copmplex, and this is not acceptable (IMHO).
> >> 
> >> I'd rather have a second package that is trivial, with mimimum, if at
> >> all, changes in the main systemd package.
> 
>  The second package turns out not to be trivial at all...

Yes, because it *is* non trivial as upstreeam does not make it trivial.

But once it is posible to (basically) do in systemd:

    cd $(@D)/src/boot; meson
    ninja -C $(@D)/src/boot build
    ninja -C $(@D)/src/boot install

Then I still think it is better to just create a new package for
systemd-boot standalone, rather than piggy-back on systemd.

Afterall, we already had this discussion back with mesa3d-headers, when
I initially tried to piggy-back on mesa3d, but was told to make a
separate package. And we have linux-headers that is separate from linux,
or uboot-tools that is separate from uboot...

[--SNIP--]
>  Finally note that I fully agree that we should not even start support for
> standalone systemd-boot until upstream progresses into making it buildable
> standalone. I really don't want that huge patch either. But that's independent
> of how standalone systemd-boot is implemented.

It's almost orthogonal, yes. But my point is, it's not because it is the
same source tree that it should be the same package in Buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
