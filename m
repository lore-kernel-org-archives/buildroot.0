From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 15:58:49 +0200
Subject: [Buildroot] [PATCH v7 5/9] core: sanitize RPATH in host tree at
 the very end of the build
In-Reply-To: <20170720154404.7533bf28@windsurf>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-6-git-send-email-wg@grandegger.com>
 <4e228fa3-0126-6752-8a98-e17967b61fb3@mind.be>
 <20170720154404.7533bf28@windsurf>
Message-ID: <2f8b3ab3-b2e6-d444-9981-bd07bfc250b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 15:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 20 Jul 2017 01:51:53 +0200, Arnout Vandecappelle wrote:
[snip]
>>  Also, host-finalize (or sdk) should depend on toolchain, and probably also on
>> $(filter host-%,$(PACKAGES)). The latter is currently incomplete, but when we
>> get around to selecting BR2_PACKAGE_HOST_* for all host packages, we will make
>> sure that 'make sdk' really generates the complete sdk.
> 
> For the SDK, you also need to build all the target packages. The SDK
> contains the sysroot (i.e STAGING_DIR), where the target packages
> install libraries and headers.

 This is what I wrote in an earlier reply to Wolfgang.


> Basically, sdk needs to depend on "world".

 Not really, it doesn't need to depend on target-finalize or the rootfs targets.

>>  And finally, I think that the staging sanitization fits better here than in
>> target-finalize. It has nothing to do with target, and the only reason that we
>> do such sanitization is to make the sdk relocatable.
> 
> The sanitization in staging and target has nothing to do with making
> the SDK relocatable. Why do you think it's related ?

 target indeed has nothing to do with making the SDK relocatable. It is only
needed to deal with stupid packages that don't correctly use --prefix/DESTDIR
and that end up putting the full absolute build-time directory in rpath.

 staging is different. Sanitizing staging is not really needed, in the sense
that any rpath in there is simply not going to be used. We want to sanitize
staging for the following reasons:

- To avoid leaking references to the original output directory. This way, we can
validate that the SDK is relocatable by running a simple "grep -r ${BASE_DIR}
${HOST_DIR}". Obviously RPATH sanitization is not sufficient (e.g. also the
references to source files have to be stripped), but it's a step in the right
direction. This reason is obviously only relevant for the SDK.

- To make sure that when an executable is copied to target that it actually
executes correctly. Since within Buildroot we never copy stuff from staging to
target, this is clearly only relevant for the SDK.

 Wolfgang, could you make sure that this explanation ends up in the commit log
of patch 3/9?

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
