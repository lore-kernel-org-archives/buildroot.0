From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 00:40:49 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-generic: support patching local
 source code
In-Reply-To: <CAB7JjA_Xc3ZCpT8RME2_nPjAGiDmp_k+yYOyvih7Bq9BSuShDA@mail.gmail.com>
References: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
 <20150409221228.GC4192@free.fr>
 <CAB7JjA_Xc3ZCpT8RME2_nPjAGiDmp_k+yYOyvih7Bq9BSuShDA@mail.gmail.com>
Message-ID: <20150409224049.GD4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-04-09 15:21 -0700, Nicolas Dade spake thusly:
> Let me explain what led me to allow patches to local source. My local
> source isn't mine. It's an SDK from the vendor of a part I'm using. The
> vendor is much better at hardware than software, and their SDK doesn't
> build as-is. So I need to patch it. I also need to maintain my patches
> separated from the SDK since the vendor publishes updates to their SDK
> every month or so.
> 
> So what I am doing is having the vendor's SDK source code unzip'ed in one
> directory, and have buildroot use [subtrees of] that directory as the local
> source, patch it with my fixes, and build it.

Ah, OK, I see. (To be honest, I was expecting something like that!)

Well, there's not much we can do with that...

On the one hand, we maintain the current behaviour, and your use-case is
broken. On the other hand, we solve a use-case like yours, but break
others where the sources are too different for our bundled patches to be
applied.

Needless to say we don't like breaking stuff...

Now, let us think about that...

Still, there's something I am wondering about. Why do you point those
packages to the vendor's SDK in the first place? Why don't you use the
ones referenced by Buildroot (e.g. from upstream)?

I can understand you'd want a few select packages from the SDK, mostly
those with HW dependencies, but the rest?

> PS I also thought that not allowing patching only for local sources was a
> strange asymmetry in buildroot. I expected local sources to work the same
> as tarballs. It wasn't until I looked into the buildroot make system that I
> realized why my patches weren't getting applied. So if you don't accept
> this patch, at least you might document that local sources cannot be
> patched in a clear way.

Well, I would think that's pretty well explained in the manual:
    http://buildroot.net/downloads/manual/manual.html#_using_buildroot_during_development

Quoting:

    When Buildroot finds that for a given package, an <pkg>_OVERRIDE_SRCDIR
    has been defined, it will no longer attempt to download, extract and
    patch the package. Instead, it will directly use the source code
    available in in the specified directory [...]

I don't know how to make that even more explicit... If you find a better
phrasing, do not hesitate! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
