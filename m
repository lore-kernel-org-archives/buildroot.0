From: Adam Jiang <chaoj@infipwr.com>
Date: Thu, 25 Dec 2014 22:25:14 +0900
Subject: [Buildroot] AC_CHECK_LIB doesn't work for cross-compiling
In-Reply-To: <20141225064950.GG6400@tarshish>
References: <549B93F3.7020602@infipwr.com> <20141225044759.GE6400@tarshish>
 <549BAE5C.409@infipwr.com> <20141225064950.GG6400@tarshish>
Message-ID: <549C103A.5000908@infipwr.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/25/2014 03:49 PM, Baruch Siach wrote:
> Hi adam,
>
> On Thu, Dec 25, 2014 at 03:27:40PM +0900, Adam Jiang wrote:
>> Here is what I got from grep in config.log.
>>
>> $ grep -i FCGX_InitRequest output/build/visage-master/config.log
>> configure:5626: checking for FCGX_InitRequest in -lfcgi
>> | char FCGX_InitRequest ();
>> | return FCGX_InitRequest ();
>> configure:5689: WARNING: unable to find the FCGX_InitRequest() function
>> ac_cv_lib_fcgi_FCGX_InitRequest=no
>>
>> I have also attached 'config.log' as well.
> The interesting part in your config.log is
>
> 	libfcgi.so: undefined reference to `frexp'
>
> This means that libfcgi.so depends on the math library (libm), but you didn't
> add it to the compile command line (-lm). Please try adding -lm to the
> AC_CHECK_LIB macro OTHER-LIBRARIES parameter as follows:
>
> 	AC_CHECK_LIB([fcgi], [FCGX_InitRequest], [LIBS="$LIBS -lfcgi],
> 		[AC_MSG_WARN("unable to find the FCGX_InitRequest() function")],
> 		[-lm])

Probably, the dependency on '-lm' issue is caused by difference between 
glibc and uclibc. Does uclibc split math library into another library 
and don't implicitly include it?

/adam

> baruch
>
>> On 12/25/2014 01:47 PM, Baruch Siach wrote:
>>> On Thu, Dec 25, 2014 at 01:34:59PM +0900, Adam Jiang wrote:
>>>> I am trying to add a new package to buildroot. the package is built upon
>>>> autotools. thus, it is supposed to be very easy to make it
>>>> cross-compilable. ever, i got suck at AC_CHECK_LIB macro. it doesn't
>>>> work well at cross-compiling while it does work on normal compiling.
>>>>
>>>> AC_CHECK_LIB([fcgi], [FCGX_InitRequest], [AC_MSG_WARN("unable to find
>>>> the FCGX_InitRequest() function")])
>>>>
>>>> always failed even though I do have libfcgi in my configuration. The
>>>> error message looks like
>>>>
>>>> checking for FCGX_InitRequest in -lfcgi... no
>>>> configure: WARNING: unable to find the FCGX_InitRequest() function
>>>>
>>>> I don't think AC_CHECK_LIB will not work on cross-compiling because it
>>>> seems there are lots of other target packages in buildroot using the
>>>> macro. Most probably, I am doing something wrong.
>>>>
>>>> Does AC_CHECK_LIB work in buildroot? If the macro needs some changes,
>>>> how could I do it?
>>> What do you have in config.log for the FCGX_InitRequest check?
