From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 14 May 2014 09:34:43 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <20140514093014.315bd371@free-electrons.com>
References: <20140513180945.GC3507@free.fr>
 <a67a948f-b496-4385-9796-fc2d079d9641@email.android.com>
 <20140513221833.016e1d8e@free-electrons.com>
 <CAAXf6LXa0MRtnb8xQ266J+O1Tp5BkWzVWJP7C3aYZCGbx8gd0w@mail.gmail.com>
 <20140514093014.315bd371@free-electrons.com>
Message-ID: <CAAXf6LUKpS7cg53fAZeu8zma22pZw7Tpw0t25cFdxdijtSrzww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 14, 2014 at 9:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 14 May 2014 09:21:33 +0200, Thomas De Schampheleire wrote:
>
>> tdescham at argentina ~/repo/contrib/buildroot-bugs $ hg diff
>> diff --git a/Config.in b/Config.in
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -369,6 +369,9 @@ config BR2_STRIP_none
>>         help
>>           Do not strip binaries and libraries in the target
>>           filesystem.
>> +
>> +source "$BR2_EXTERNAL/test.in"
>> +
>>  endchoice
>>
>>  config BR2_STRIP_EXCLUDE_FILES
>> diff --git a/support/dummy-external/test.in b/support/dummy-external/test.in
>> new file mode 100644
>> --- /dev/null
>> +++ b/support/dummy-external/test.in
>> @@ -0,0 +1,2 @@
>> +config BR2_STRIP_test
>> +       bool "test"
>>
>>
>> test.in would either exist in dummy-external, or in BR2_EXTERNAL, so
>> there is no problem of missing files.
>> It requires a separate file in BR2_EXTERNAL that has to be present if
>> you choose to use BR2_EXTERNAL, but can be empty. Moreover, you need
>> one such file for each choice you want to expand this way.
>> I'm leaning more towards the preflight check, but I just want to
>> highlight that expanding a choice from BR2_EXTERNAL is effectively
>> possible.
>
> Then it means that as soon as you define a BR2_EXTERNAL value, it
> *must* point to a directory containing all the "<foo>.in" files for all
> possible virtual packages that Buildroot has. This really doesn't seem
> nice.
>
> Remember, we're not talking about *one* choice option here, we're
> talking about one *per* virtual package: one for EGL, one for OpenVG,
> one for OpenGLES, one for OpenGL, one for ..., one for ...
>

Yes indeed. It's not nice, but it's possible.
By the way, it also means that whenever a new choice is added, every
BR2_EXTERNAL in the world needs to be updated in order to work
correctly.

This could be solved if it were possible to merge a set of dummy such
files with the actual BR2_EXTERNAL. Or by using different env
variables BR2_EXTERNAL_FOR_CHOICE_EGL, BR2_EXTERNAL_FOR_CHOICE_OPENVG,
... where these variables are set to either BR2_EXTERNAL or
dummy-external, depending on the existence of the corresponding file.
These variables would be set by buildroot, before calling menuconfig.
But as you can see, it becomes very ugly.

Best regards,
Thomas
