From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 12:41:52 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <871ry518wo.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 01 Aug 2019 12:23:35 +0200")
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-2-titouan.christophe@railnova.eu>
 <871ry518wo.fsf@dell.be.48ers.dk>
Message-ID: <87sgqlyxov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> +ifeq ($(BR2_STATIC_LIBS),y)
 >> +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no
 >> +else
 >> +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no WITH_SHARED_LIBRARIES=yes
 >> +endif

 > We actually have 3 variants:

 > - static only (BR2_STATIC_LIBS)
 > - shared only (BR2_SHARED_LIBS)
 > - shared and static (BR2_SHARED_STATIC_LIBS)

 > So I reworked it to take that into consideration and committed, thanks.

Sorry, I will have to take that back. I did a test compilation with a
completely static (BR2_STATIC_LIBS) setup, which failed:

In file included from security.c:25:
lib_load.h:23:11: fatal error: dlfcn.h: No such file or directory
 # include <dlfcn.h>
           ^~~~~~~~~
compilation terminated.

The loadable plugin logic in security.c seems to be built
unconditionally, so that cannot work in a completely static setup.

Care to bring up this issue upstream?

In the mean time I have marked your patch as changes requested. For
reference, the changes I did in mosquitto.mk look like this:

feq ($(BR2_SHARED_LIBS),y)
MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no
else
MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes
endif

ifeq ($(BR2_STATIC_LIBS),y)
MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=no
else
MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=yes
endif

-- 
Bye, Peter Korsgaard
