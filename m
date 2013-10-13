From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 13 Oct 2013 21:44:08 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
In-Reply-To: <20131008101327.5ee7cc9c@skate>
References: <20131006232954.71da4d75@skate>	<420407879.8180852.1381219913546.JavaMail.root@openwide.fr>
 <20131008101327.5ee7cc9c@skate>
Message-ID: <525AF808.4000207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 08/10/2013 10:13, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Tue, 8 Oct 2013 10:11:53 +0200 (CEST), Romain Naour wrote:
> 
>> | > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> | > +LIBCAP_LDFLAGS=-fPIC
>> | > +endif
>> | 
>> | This seems really weird, because normally, we would expect exactly
>> | the
>> | opposite: position independent code is needed for shared libraries,
>> | not
>> | for static libraries.
>>
>> Ok, I'll take the problem from the beginning.
>> Sorry for that mistake.
> 
> Note that I'm not sure about what I said, but having to build with
> -fPIC in the static lib case seems really strange.
> 
> Thanks!
> 
> Thomas
> 

You're right, the static lib isn?t built with -fPIC.
But the libcap build system build the static and shared libraries,
even if you don't want one of them.

The build failure [1] is caused by the missing -fPIC during the build of libcap.so.2.22

So, we may add -fPIC if BR2_PREFER_STATIC_LIB=y and the shared lib is build correctly
(ok it's weird)
Or add a patch for enable/disable separately the static/shared build.

Best regards,
Romain Naour

[1] http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/
