From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 Jun 2019 01:49:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/poppler: fix build with
 cmake < 3.10
In-Reply-To: <CAPi7W812BPvxYRoC7sT-4XMycvK59+ddr7rnMwRvOZEsS87ibA@mail.gmail.com>
References: <20190602191922.9491-1-fontaine.fabrice@gmail.com>
 <e2df5d8e-3dcc-3c59-6805-2b67336c6f23@mind.be>
 <1cf9a9f0-4621-fae3-3cd1-a0632e539031@mind.be>
 <CAPi7W812BPvxYRoC7sT-4XMycvK59+ddr7rnMwRvOZEsS87ibA@mail.gmail.com>
Message-ID: <60e72a50-9cd8-1b78-7671-14b7bf507e2a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/06/2019 22:21, Fabrice Fontaine wrote:
> Dear Arnout,
> 
> Le sam. 8 juin 2019 ? 21:41, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>>
>>
>> On 08/06/2019 21:41, Arnout Vandecappelle wrote:
>>>
>>>
>>> On 02/06/2019 21:19, Fabrice Fontaine wrote:
>>>> Fixes:
>>>>  - http://autobuild.buildroot.org/results/f9e24d38d3aa4519615c5a0ae7f62af610df976f
>>>>
>>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>> ---
>>>>  package/poppler/poppler.mk | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
>>>> index a2bb7e3049..56998dd530 100644
>>>> --- a/package/poppler/poppler.mk
>>>> +++ b/package/poppler/poppler.mk
>>>> @@ -20,6 +20,9 @@ POPPLER_CONF_OPTS = \
>>>>      -DENABLE_GOBJECT_INTROSPECTION=OFF \
>>>>      -DENABLE_GTK_DOC=OFF
>>>>
>>>> +# cmake older than 3.10 require this to avoid try_run() in FindThreads
>>>> +POPPLER_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
>>>
>>>  This made no sense to me: we do have threads (because we depend on it), and the
>>> compiler does accept the -pthread argument (and it is preferred over -lpthread
>>> for static scenarios), so why set it to OFF?
>>>
>>>  In addition, the key option is THREAD_HAVE_PTHREAD_ARG, not THREAD_PTHREAD_ARG.
> We're already passing -DTHREADS_PTHREAD_ARG=OFF to exiv2, i2pd,
> rabbitmq-c, xerces, librtlsdr, libssh and paho-mqtt-cpp.
> The commit message of librltsdr commit [1] specifies that setting this
> variable to OFF only disable the TRY_RUN call.

 Argh, I shouldn't be fixing things up like that while applying :-(

 Of course, we should primarily be consistent. So I pushed a follow-up commit
that reverts it to your version.

 That said...


> Should we update all these packages to use your new proposal?

 Indeed, I think we should use THREAD_HAVE_PTHREAD_ARG.

 Unfortunately, I can't seem to reproduce the original issue with librtlsdr -
there might be something there that would not get fixed by my proposal.

 Also, I think it's plain silly that we do this thing for each individual
package that tries to use threads. It should be part of the toolchainfile.cmake.
But then, of course, the setting should depend on the availability of threads.

 Regards,
 Arnout

>>>
>>>  So I changed the patch to set THREAD_HAVE_PTHREAD_ARG=ON.
>>
>>  ... and applied to master, thanks. In case it wasn't obvious :-)
>>
>>  Regards,
>>  Arnout
>>
>>>
>>>  Note that static linking still fails horribly with dozens of missing libraries
>>> (cfr. [1]). I think we should disable it for static.
>>>
>>>  Regards,
>>>  Arnout
>>>
>>> [1] http://autobuild.buildroot.net/results/e409863724005a0c182476612187a322a16a7db8
>>>
>>>> +
>>>>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>>>>  POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
>>>>  endif
>>>>
> Best Regards,
> 
> Fabrice
> 
> [1] https://git.buildroot.net/buildroot/commit/package/librtlsdr?id=4c6eace6f756d15ae9639a503c9245d1e7fb12a9
> 
