From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 23:04:28 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: fix static build with snappy
In-Reply-To: <CAPi7W81VmJbfES03hTnJte8L+9sA_cRExo7jJ9iCs68iq63ZHg@mail.gmail.com>
References: <20190528203230.24558-1-fontaine.fabrice@gmail.com>
 <20190528224235.7b5a2647@windsurf.home>
 <CAPi7W81VmJbfES03hTnJte8L+9sA_cRExo7jJ9iCs68iq63ZHg@mail.gmail.com>
Message-ID: <19f31deb-ea26-23aa-e2f7-eca629875ab2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 22:48, Fabrice Fontaine wrote:
> Dear Thomas and Arnout,
> 
> Le mar. 28 mai 2019 ? 22:42, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
>>
>> Hello,
>>
>> On Tue, 28 May 2019 22:32:30 +0200
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/419468f0d7d3c2b64d420513aa9505c6de097ed2
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>>>  - Set linker to CXX instead of adding -lstdc++ to LIBS
>>
>> Is this really the right thing to do? Ideally a program written in C
>> should not have to know that a library it is using is written in C++.

 Hm, good point... Snappy provides a C wrapper, so there should indeed not be a
need for the client to use the C++ linker. Of course, there also shouldn't be a
need for the client to link with libstdc++ :-). I guess ideally Snappy would
somehow include the libstdc++ link in its EXPORT directive, but I have no idea
how to achieve that...

>> We already had a similar situation in Buildroot, and so far we have
>> added -lstdc++. For example:
>>
>> ifeq ($(BR2_PACKAGE_DIRECTFB),y)
>> LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
>> ifeq ($(BR2_STATIC_LIBS),y)
>> LINKS_CONF_ENV += LIBS=-lstdc++
>>
>> and there's a few other examples in the tree. To be honest, I don't
>> know what is the most correct solution, I'm just trying to make sure we
>> solve a given problem in the same way everywhere.

 In most other cases we don't do any patching but we pass it through LIBS or
similar. I don't think that that's possible with CMake.

 For ICU, we patch the .pc file, which is the proper thing to do, but Snappy
doesn't have a .pc file.

 The only one where we do it with patching is xvkbd, but there we create the
entire (generated) Makefile so it doesn't count.

 But yeah, in keeping with the 'add -lstdc++' principle, and because the patch
is smaller, maybe v1 was better.

> I don't know either. You can apply the first or the second version of
> this patch.

 I reset its state to New. Now Thomas can decide :-)


> Then, I'll send the chosen version upstream. If they don't like it,
> I'll have the second solution as a fallback.

 Maybe just send both versions upstream, since you have them both now. Then they
can choose which one they like better.

 Regards,
 Arnout
