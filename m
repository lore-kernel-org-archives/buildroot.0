From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 21:41:53 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/poppler: fix build with
 cmake < 3.10
In-Reply-To: <e2df5d8e-3dcc-3c59-6805-2b67336c6f23@mind.be>
References: <20190602191922.9491-1-fontaine.fabrice@gmail.com>
 <e2df5d8e-3dcc-3c59-6805-2b67336c6f23@mind.be>
Message-ID: <1cf9a9f0-4621-fae3-3cd1-a0632e539031@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/06/2019 21:41, Arnout Vandecappelle wrote:
> 
> 
> On 02/06/2019 21:19, Fabrice Fontaine wrote:
>> Fixes:
>>  - http://autobuild.buildroot.org/results/f9e24d38d3aa4519615c5a0ae7f62af610df976f
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/poppler/poppler.mk | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
>> index a2bb7e3049..56998dd530 100644
>> --- a/package/poppler/poppler.mk
>> +++ b/package/poppler/poppler.mk
>> @@ -20,6 +20,9 @@ POPPLER_CONF_OPTS = \
>>  	-DENABLE_GOBJECT_INTROSPECTION=OFF \
>>  	-DENABLE_GTK_DOC=OFF
>>  
>> +# cmake older than 3.10 require this to avoid try_run() in FindThreads
>> +POPPLER_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
> 
>  This made no sense to me: we do have threads (because we depend on it), and the
> compiler does accept the -pthread argument (and it is preferred over -lpthread
> for static scenarios), so why set it to OFF?
> 
>  In addition, the key option is THREAD_HAVE_PTHREAD_ARG, not THREAD_PTHREAD_ARG.
> 
>  So I changed the patch to set THREAD_HAVE_PTHREAD_ARG=ON.

 ... and applied to master, thanks. In case it wasn't obvious :-)

 Regards,
 Arnout

> 
>  Note that static linking still fails horribly with dozens of missing libraries
> (cfr. [1]). I think we should disable it for static.
> 
>  Regards,
>  Arnout
> 
> [1] http://autobuild.buildroot.net/results/e409863724005a0c182476612187a322a16a7db8
> 
>> +
>>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>>  POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
>>  endif
>>
