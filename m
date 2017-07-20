From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Jul 2017 00:30:52 +0200
Subject: [Buildroot] [PATCH v8 08/10] external-toolchain: check if a
 buildroot SDK has already been relocated
In-Reply-To: <20170720232131.02e9a51d@windsurf>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-9-git-send-email-wg@grandegger.com>
 <20170720232131.02e9a51d@windsurf>
Message-ID: <9cca1b92-5e7e-2788-8370-59b12078396f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 23:21, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 20 Jul 2017 16:35:19 +0200, Wolfgang Grandegger wrote:
>> The location of the buildroot SDK is stored in the file "sdk-location"
>> in "share/buildroot". If it's content does not match the current
>> SDK location, ask the user to run the script "relocate-sdk.sh" in the
>> top directory once. The external toolchain may be a pre-installed one
>> in a directory that is not writeable by us. Therefore, we can't run
>> the script directly.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>  toolchain/helpers.mk                                   | 16 ++++++++++++++++
>>  toolchain/toolchain-external/pkg-toolchain-external.mk |  1 +
>>  2 files changed, 17 insertions(+)
> 
> Now that I think of it, this is going to be a bit annoying. This means
> that whenever you want to use a Buildroot-generated toolchain as an
> external toolchain in another Buildroot configuration, you have to run
> this relocate script.
> 
> This will break a lot of things, like the autobuilders, the runtime
> test infrastructure, etc. that all rely on pre-built Buildroot
> toolchains, but don't run the relocate-sdk script. In addition, we
> simply can't do it, because it's directly Buildroot itself that
> downloads the toolchain tarball and extracts it, so we don't even get
> the opportunity to run the relocate-sdk script.

 Well, we could run the script directly for downloaded toolchains, and do the
check for pre-installed toolchains. Does that sound acceptable?

 I'm probably forgetting something though :-)

 Regards,
 Arnout

> 
> Therefore, I cannot apply this as-is, a better solution needs to be
> found.
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
