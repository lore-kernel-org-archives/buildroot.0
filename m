From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 17:44:30 +0100
Subject: [Buildroot] [PATCH V2 1/2] tcl: add support for static builds
In-Reply-To: <20150307144233.5ee1db01@free-electrons.com>
References: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150307144233.5ee1db01@free-electrons.com>
Message-ID: <54FB2AEE.30108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 14:42, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Sat, 7 Mar 2015 13:22:41 +0000, Vicente Olivert Riera wrote:
> 
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +# Do not build tclsh with dynamic loading support when building it
>> +# statically because it needs dlopen() and friends.
>> +TCL_CONF_OPTS += --disable-load
>> +# Also, build only the binaries and libraries and don't build the
>> +# 'packages' because they are shared objects which are intended to be
>> +# loaded dynamically.
>> +TCL_MAKE_OPTS = binaries libraries
>> +TCL_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-binaries install-libraries
>> +TCL_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
>> +endif
> 
> But, if we don't build the 'packages', is the tcl stuff still useful?

 The packages are a bunch of additional packages that happen to be distributed
together with tcl. In this case:

incr Tcl (object-oriented extensions)
sqlite
thread
tdbc (database connector)

 So if you want to run scripts that make use of these packages, yes you're in
trouble. But I expect that there will be plenty of scripts that don't use these
extensions.


 That said, I agree with Thomas's final statement that unless you're actually
using this, it's both pointless and dangerous to make such a change.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
