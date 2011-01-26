From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 26 Jan 2011 10:56:02 +0100
Subject: [Buildroot] [PATCH v2 4/4] cdrkit: convert to CMAKETARGETS
	infrastructure
In-Reply-To: <20110126094315.3eb2cd52@surf>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-5-git-send-email-bjorn.forsman@gmail.com>
	<20110126094315.3eb2cd52@surf>
Message-ID: <AANLkTiktCTX9Zp49YXRExqVe6PWX4DkvC-Vanb9QoFWZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 January 2011 09:43, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Bjorn,
>
> On Sat, 15 Jan 2011 21:53:28 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> +## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
>> +## some extra flags so it finds needed libs and headers.
>> +CDRKIT_CONF_OPT += -DCMAKE_REQUIRED_INCLUDES="$(STAGING_DIR)/usr/include"
>> +CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
>> +HOST_CDRKIT_CONF_OPT += -DCMAKE_REQUIRED_INCLUDES="$(HOST_DIR)/usr/include"
>> +HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
>
> This does not seem to be sufficient: I don't have <sys/capability.h>
> installed system-wide, but it is present in $(HOST_DIR)/usr/include,
> but still host-cdrkit doesn't build:
>
> /home/thomas/local/outputs/cmake/build/host-cdrkit-1.1.10/wodim/wodim.c:78:56: error: sys/capability.h: No such file or directory

Ah, I see. CMAKE_REQUIRED_INCLUDES is only used by CHECK_INCLUDE_FILES
(the macro that initially finds sys/capability.h):

-- Looking for include files HAVE_SYS_CAPABILITY_H
-- Looking for include files HAVE_SYS_CAPABILITY_H - found

But CMAKE_REQUIRED_INCLUDES is clearly not used during the build. I
guess I misinterpreted the docs. (Hm... I wonder what purpose
CMAKE_REQUIRED_INCLUDES has then...) I'll replace it with
CMAKE_C_FLAGS. And I'll remove sys/capability.h from my system so I
can spot these things :-)

Thanks for the report.

Best regards,
Bj?rn Forsman
