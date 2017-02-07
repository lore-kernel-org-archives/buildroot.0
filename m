From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Feb 2017 23:14:30 +0100
Subject: [Buildroot] [PATCH] Don't disable dependency tracking if using
 <pkg>_OVERRIDE_SRCDIR.
In-Reply-To: <20170206193729.i3epqqqekvlgiime@zenon.in.qult.net>
References: <20170201135310.3ghqvpqww25jfzm2@zenon.in.qult.net>
 <2a135f21-ffe1-06b8-37d3-e78f7a51798f@gmail.com>
 <20170206193729.i3epqqqekvlgiime@zenon.in.qult.net>
Message-ID: <f2750ce8-3ac0-6e72-20ca-1c2141b7621a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ignacy,

Le 06/02/2017 ? 20:37, Ignacy Gaw?dzki a ?crit :
> On Mon, Feb 06, 2017 at 07:39:00PM +0100, thus spake Romain Naour:
>> Hi Ignacy,
>>
>> Le 01/02/2017 ? 14:53, Ignacy Gaw?dzki a ?crit :
>>> Include the --disable-dependency-tracking option in
>>> <pkg>_CONFIGURE_CMDS only on the condition that <pkg>_OVERRIDE_SRCDIR
>>> is empty.  Dependency tracking is very welcome while developing in
>>> order to properly rebuild when calling make <pkg>-rebuild for
>>> instance.
>>>
>>> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
>>> ---
>>>  package/pkg-autotools.mk | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
>>> index f7b8488..e8579f4 100644
>>> --- a/package/pkg-autotools.mk
>>> +++ b/package/pkg-autotools.mk
>>> @@ -199,7 +199,8 @@ define $(2)_CONFIGURE_CMDS
>>>  		--disable-documentation \
>>>  		--with-xmlto=no \
>>>  		--with-fop=no \
>>> -		--disable-dependency-tracking \
>>> +		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),, \
>>> +		   --disable-dependency-tracking) \
>>>  		--enable-ipv6 \
>>>  		$$(DISABLE_NLS) \
>>>  		$$(SHARED_STATIC_LIBS_OPTS) \
>>> @@ -232,7 +233,8 @@ define $(2)_CONFIGURE_CMDS
>>>  		--disable-debug \
>>>  		--with-xmlto=no \
>>>  		--with-fop=no \
>>> -		--disable-dependency-tracking \
>>> +		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),, \
>>> +		   --disable-dependency-tracking) \
>>
>> You're likely working on the target variant, so probably you can let the
>> dependency tracking enabled for the host?
> 
> Dependency tracking was initially *disabled* for both target and host.
> I suppose that <pkg>_OVERRIDE_SRCDIR works for both target and host,
> so I don't see why we should leave it disabled for one and not the
> other.

Indeed <pkg>_OVERRIDE_SRCDIR works for both target and host packages and the
"dependency tracking" was disabled (see [1]) to reduce the build time.

My initial feeling is to allow to enable the "dependency tracking" only when
doing active development on a *target* package using <pkg>_OVERRIDE_SRCDIR.
Buildroot is unlikely used for active development on a *host* package.

But ok, if you're using <pkg>_OVERRIDE_SRCDIR for a host package, you probably
don't really care of the build time...

Lets see other opinion.

Best regards,
Romain

[1]
https://git.busybox.net/buildroot/commit/?id=3e37b0fc6cbbe2245e39fedb247a381fb4e0d992

> 
> Regards,
> 
> Ignacy
> 
