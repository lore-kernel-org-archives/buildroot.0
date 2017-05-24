From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 May 2017 23:54:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/sngrep: fix static build with
 gnutls
In-Reply-To: <20170524084733.37fd3ca1@free-electrons.com>
References: <20170520162751.30809-1-romain.naour@gmail.com>
 <20170520162751.30809-2-romain.naour@gmail.com>
 <20170523162742.23372fb2@free-electrons.com>
 <9efd1b94-8830-15b9-8d17-608ce8eace50@gmail.com>
 <20170524084733.37fd3ca1@free-electrons.com>
Message-ID: <d46413c8-2cf8-08cd-ce1e-f821896fa3bb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/05/2017 ? 08:47, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue, 23 May 2017 23:20:14 +0200, Romain Naour wrote:
> 
>> I think this patch is not necessary anymore since gnutls shouldn't be linked
>> statically, see [1].
>>
>> The code use __attribute__((constructor)) and __attribute__((destructor)) to
>> call constructor/desctructor when a shared library is loaded.
>> Constructor/desctructor are not used when a static library is used (except when
>> if -Wl,--whole-archive -lgnutls -Wno-whole-archive is used, not tested).
>>
>> Even if gnutls initialization (_gnutls_global_init()) may be called manually,
>> the maintainer said it's not supported.
>>
>> So we should add !BR2_STATIC_LIBS for gnutls package ?
>> Doing so, it will avoid all static linking issues with gnutls (taskd, ffmpeg,
>> sngrep...)
> 
> Yes, I believe we should add !BR2_STATIC_LIBS, of course propagated to
> all reverse dependencies (but there are not too many of them).

Ok, I'll do it.

> A side question is: is there a way to detect/error out when some code
> is using this constructor/destructor mechanism in a way that doesn't
> work for static linking? It would be useful to check if other packages
> are affected.

I don't know, I don't think so...

Now the gnutls script warn about static linking:
https://gitlab.com/gnutls/gnutls/commit/6b748886799f88ddee9721dba4fc4d52854832ae

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
