From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 23 Jul 2013 09:19:28 +0200
Subject: [Buildroot] Problem compiling local code
In-Reply-To: <6A282818-6448-427C-A748-B4FFC1934E7D@deadfrog.net>
References: <4FDB62BA-61E8-4C1C-8835-61BC2DCF0FA4@deadfrog.net>
 <CAAXf6LXmwk0NwheagUtnSX5u9iZei2ieJLs6+XyFqRXm4zKSyA@mail.gmail.com>
 <79A67ED1-220E-4FA4-BD5B-01A70D079C06@deadfrog.net>
 <6A282818-6448-427C-A748-B4FFC1934E7D@deadfrog.net>
Message-ID: <CAAXf6LUg2_Nfxuys9cj22P0a7VpeP1NF5JyCYwrnaP+CbDB-Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Mon, Jul 22, 2013 at 10:38 PM, Ryan Wilkins <ryan@deadfrog.net> wrote:
>
>
> On Jul 22, 2013, at 4:14 PM, Ryan Wilkins <ryan@deadfrog.net> wrote:
>
>>
>>
>> On Jul 19, 2013, at 1:29 AM, Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
>>
>>> Hi Ryan,
>>>
>>> Is there any output regarding the hello package, like 'downloading',
>>> 'extracting', 'building', etc. or nothing at all?
>>> What is the name of the config option that you added, and are you sure
>>> it's enabled in .config?
>>>
>>> What happens if you explicitly run 'make hello' ?
>>>
>>> Depending on what you did before, you may also need to clear previous
>>> attempts from the output, for example with:
>>> make hello-dirclean
>>>
>>> If the hello package is seen correctly by buildroot, but the
>>> compilation doesn't work correctly, you may want to add
>>> KBUILD_VERBOSE=1 to the make command, to see the actual make command
>>> executed.
>>>
>>> Best regards,
>>> Thomas
>>
>> Thomas,
>>
>> Thanks for the response.  After some digging around, I found that buildroot wasn't even trying to grab or compile my code.  What I discovered earlier today is that the variable names that I was using contained too many underscores.  My Config.in and hello.mk files were using variables set as BR2_PACKAGE_COMPANY_PROJECT_HELLO.  When I shortened it to just BR2_PACKAGE_HELLO then it started working properly.  Apparently the additional underscores confused some parsing of the buildroot and/or Kbuild system.  If that was mentioned in the documentation then I missed it.  Maybe it was assumed.  In any case, it's working now.
>>
>> Thanks for your help on this.  I appreciate it.
>>
>
> And I put the wrong variable names down in this email.  Was going from memory while my wife was driving the car.
>
> Config.in had BR2_PACKAGE_COMPANY_PROJECT_HELLO which changed to BR2_PACKAGE_HELLO.
>
> hello.mk had COMPANY_PROJECT_HELLO_ variable names prefix which changed to HELLO_.
>
> That solved the issues.
>

Thanks for reporting back. Buildroot indeed expects
BR2_PACKAGE_<packagename> in the Config.in files, and
<packagename>_... for the .mk files. I also couldn't find this
restriction explicitly mentioned in the documentation, it's only
implicitly shown in the examples.  You're very welcome to send a patch
to update the documentation in this respect!

Best regards,
Thomas
