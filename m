From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Feb 2014 12:53:30 +0100
Subject: [Buildroot] [PATCH 10/10] hostapd: fix static build failure
In-Reply-To: <20140118200524.GF23411@free.fr>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-11-git-send-email-s.martin49@gmail.com>
 <20140118200524.GF23411@free.fr>
Message-ID: <CAHXCMMJqWkT-3+StwS=ttW1+cN2Qa0-9vrx_kN0n18kkLheLMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 18, 2014 at 9:05 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2014-01-18 20:23 +0100, Samuel Martin spake thusly:
>> When building statically hostapd with openssl support, it is necessary
>> to add -lz to LIBS to avoid undefined symbols when linking against
>> libcrypto.a.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Shouldn't we fix openssl's libcrypto.pc instead?
> Adding -lz to Libs.private should do the trick, I guess, no?
>

Well, both openssl and hostapd use custom build-system (ie.
handwritten configure script and makefiles)...
What a pity! :-(

- on the openssl side:
when building the static library, the libcrypto.pc is wrong because of
what Yann points out (no -lz in Libs.private);

- on the hostapd side:
they just don't care/check about linking against the static library of
libcrypto, they just only add -lcrypto to the ldflags.

So, the right fix would be fixing the *.pc generation in openssl and
call pkg-config to set the cflags and ldflags in hostapd but add a
host-pkgconf dependency.
OTOH, the quickest fix is this patch...

Any input about the preferred way to fix it is welcome.


Regards,

-- 
Samuel
