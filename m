From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 12:27:22 +0200
Subject: [Buildroot] [PATCH 2/3] package/mosquitto: Switch systemd unit
 to Type=notify and depend on network
In-Reply-To: <20190718100636.27290-3-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Thu, 18 Jul 2019 12:06:35 +0200")
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-3-titouan.christophe@railnova.eu>
Message-ID: <87wofxyyd1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

It would be great if your commit message would explain _WHY_ this is
done, not just _WHAT_ the change is - E.G. what is the advantage of type=notify?

 > ---
 > RFC: Would it be better to use the mosquitto.service file provided upstream ?
 > https://github.com/eclipse/mosquitto/blob/master/service/systemd/mosquitto.service.notify

Not knowing much about systemd, but I think so. The differences look
quite small.

> ---
 >  package/mosquitto/mosquitto.mk      | 4 ++++
 >  package/mosquitto/mosquitto.service | 3 +++
 >  2 files changed, 7 insertions(+)

 > diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
 > index ed72af754a..333cce35c2 100644
 > --- a/package/mosquitto/mosquitto.mk
 > +++ b/package/mosquitto/mosquitto.mk
 > @@ -23,6 +23,10 @@ else
 >  MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no WITH_SHARED_LIBRARIES=yes
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 > +MOSQUITTO_MAKE_OPTS += WITH_SYSTEMD=yes

This is not mentioned in the commit message. I see this causes mosquitto
to link with -lsystemd, so you need to add systemd to
MOSQUITTO_DEPENDENCIES.

Care to send an updated patch with a more descriptive commit message,
reusing the upstream service file and adding systemd to _DEPENDENCIES?

-- 
Bye, Peter Korsgaard
