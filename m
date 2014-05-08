From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 May 2014 01:24:19 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140507093155.18034c1d@free-electrons.com>
References: <20140507063009.23A95100E55@stock.ovh.net>
 <20140507093155.18034c1d@free-electrons.com>
Message-ID: <536C1223.1060801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/14 09:31, Thomas Petazzoni wrote:
>>        arm |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/7c552e514f8c13ba8cdd420dc5bbf5edac915a83/

> Oh maan, I hate C++ errors. Any C++ person in the place to explain
> what's going on? Might be related to BR2_PREFER_STATIC_LIB.

 The issue is that the curve_keygen tool is written in C, but the zeromq library
itself is C++. Therefore, it needs to be linked with libstdc++. With dynamic
linking, the ELF dependencies will take care of that, but with static linking,
it has to be added explicitly. And it looks like libtool doesn't find that
dependency on libstdc++.

 Renaming curve_keygen.c to curve_keygen.cpp and adjusting Makefile.am
accordingly solves it, but I'm not sure if that is the best solution...

 Oh well, adding LIBS=-lstdc++ works as well...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
