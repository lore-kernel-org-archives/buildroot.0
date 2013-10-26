From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Oct 2013 06:48:28 -0300
Subject: [Buildroot] [PATCH 5/5] thrift: new package
In-Reply-To: <OFFFC3A740.7C7B430A-ON86257C10.000F397E-86257C10.001197E6@rockwellcollins.com>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-5-git-send-email-gustavo@zacarias.com.ar>
 <OFFFC3A740.7C7B430A-ON86257C10.000F397E-86257C10.001197E6@rockwellcollins.com>
Message-ID: <526B8FEC.2000607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/2013 12:12 AM, Ryan Barnett wrote:
> Could you move the license to right below the site? It doesn't really 
> matter but I guess I like to see version, site, license as the first 
> things in a package. I guess there isn't any official standard to the way 
> a package makefile should be in but I guess that is just my person 
> preference. 

Huh, that's very OCD :)
There are several packages that don't keep them ordered, specially those

>> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> +# openssl uses zlib, so we need to explicitly link with it when static
>> +THRIFT_CONF_ENV += LIBS=-lz
> 
> Shouldn't you add a dependancy on libz then?
> 
> THRIFT_DEPENDCIES += zlib

It's implicit from openssl, we don't build openssl without zlib (it's
possible to do so, but not really that useful and would complicate other
packages).

> I haven't tested this so I don't fully understand what exactly what you 
> are doing here. I see that this is an autotools package but it doesn't 
> appear to be building or installing using the autotools infrastructure. 
> Could you please elaborate a little bit more of why exactly you can't use 
> autotoools to build for this? I believe I understand what you are doing 
> here but I guess I would like a few more details from you. 
> 
> Also it looks like thrift is a compiler, so wouldn't we want to have this 
> available as a host tool because presumably there would be a need to to 
> add custom user packages that utilize Thrift to compile their application. 
> Again I haven't had time to read further what exactly thrift does but 
> these are just the few things that are coming to my mind tonight.
> 
> I will try to investigate this a little bit more in the coming days (next 
> week) but for now this are my initial reaction comments.

A quick overlook then.
Thrift is basically a compiler and runtime libs.
The compiler component is only useful for the host because we don't do
development on the target any more, that would be host-boost, which IS
actually using autotools infra (no defines overriding HOST_THRIFT_*_CMDS).
For the target the INSTALL phase has an override to just install the
runtime libraries and avoid the compiler, tests and examples.
The target BUILD override patches the thrift makefiles to use $(THRIFT)
rather than hardcode it (the for-SED loop), and builds passing $(THRIFT)
to the appropiate host-compiled one (since it's hell bent on using it's
own built one which would be cross and wouldn't run).
This is a double catch though, i wanted to build examples as a sane way
to test it that things are ok but not install them.
Regards.
