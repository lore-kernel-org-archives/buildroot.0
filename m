From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Jan 2021 22:44:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-capnproto: fix tarball hash
In-Reply-To: <20210113212233.GB609249@scaer>
References: <20210112181159.12172-1-fontaine.fabrice@gmail.com>
 <20210113211700.GA609249@scaer> <20210113212233.GB609249@scaer>
Message-ID: <20210113214406.GC609249@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-13 22:22 +0100, Yann E. MORIN spake thusly:
> On 2021-01-13 22:17 +0100, Yann E. MORIN spake thusly:
> > On 2021-01-12 19:11 +0100, Fabrice Fontaine spake thusly:
> > > Commit 5b95a5dc27c0d8002c00bda1c867ddea9218087e seems to have made a
> > > mistake in the tarball hash
> > 
> > Actually, I just re-checked locally, and I indeed still get the hash
> > currently in the tree.
> Ah, but I am able to reproduce the problem with the _host_ variant!
> 
> So, the hash is correct when downloading the target variant, but it is
> not when downloading the host variant. Woot.. Weird... :-/

So what if I interrrupt the download process right after the archive is
generated from the git repo, but just before we check the hashes ?

    $ ls -l output/build/.c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz.Byiova/output
    -rw-r--r-- 1 ymorin ymorin 82K Jan 13 22:25 output/build/.c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz.Byiova/output

    $ ls -l ${BR2_DL_DIR}/c-capnproto/c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
    -rw-r--r-- 1 ymorin ymorin 1.4M Jan 13 22:20 c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz

Wut? 82K vs. 1.4M?

And just by looking at package/c-capnproto/c-capnproto.mk I got an epiphany.
c-capnproto uses git submodules.

And indeed, the git submodule setting is not inherited from the target
variant to the host variant.

Joel: why is the host variant building successfully, but the target
variant needs the git submodules? Anyway, this is a separate topic for
further investigation.

Anyway, this is a real bug in our infra. How many packages are affected?
To be affected, a package must use git submodules, and have a host
variant:

    $ git grep -l 'GIT_SUBMODULES = YES' |sed -r -e '\,support/,d'
    package/azure-iot-sdk-c/azure-iot-sdk-c.mk
    package/brickd/brickd.mk
    package/c-capnproto/c-capnproto.mk
    package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
    package/gstreamer1/gst1-shark/gst1-shark.mk
    package/open62541/open62541.mk

And how many have a host variant:

    $ grep -l -E 'host-.+-package' $(git grep -l 'GIT_SUBMODULES = YES' |sed -r -e '\,support/,d')
    package/c-capnproto/c-capnproto.mk

Exactly one.

I missed one package when doing the conversion. One, Damned. Package.
And we were lucky one of the autobuilders noticed only just a few days
later.

Woot!

I'll send a fix patch, but the hash is definitely correct.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
