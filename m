From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 14 May 2014 09:21:33 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <20140513221833.016e1d8e@free-electrons.com>
References: <20140513180945.GC3507@free.fr>
 <a67a948f-b496-4385-9796-fc2d079d9641@email.android.com>
 <20140513221833.016e1d8e@free-electrons.com>
Message-ID: <CAAXf6LXa0MRtnb8xQ266J+O1Tp5BkWzVWJP7C3aYZCGbx8gd0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 13, 2014 at 10:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> (Would be nice to wrap your e-mails!)

Yes sorry, it's the darn K9 mail app on Android that does not offer a
wrap option (or wraps the entire mail including the mail you reply
on).
Who makes a decent mailing list friendly app for Android?

>
> On Tue, 13 May 2014 22:12:59 +0200, Thomas De Schampheleire wrote:
>
>> >  - going with the choice means that it is no longer possible to add a
>> >    new provider in BR2_EXTERNAL without changing the Buildroot source
>> >    tree, one of the main selling-point of BR2_EXTERNAL to begin with,
>>
>> I guess it's not possible to put an 'include' statement inside the choice? The included file would then just contain the external options.
>
> What would it include? Remember that include statements in kconfig fail
> if the target file doesn't exist.

Something like this (tested):
tdescham at argentina ~/repo/contrib/buildroot-bugs $ hg diff
diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -369,6 +369,9 @@ config BR2_STRIP_none
        help
          Do not strip binaries and libraries in the target
          filesystem.
+
+source "$BR2_EXTERNAL/test.in"
+
 endchoice

 config BR2_STRIP_EXCLUDE_FILES
diff --git a/support/dummy-external/test.in b/support/dummy-external/test.in
new file mode 100644
--- /dev/null
+++ b/support/dummy-external/test.in
@@ -0,0 +1,2 @@
+config BR2_STRIP_test
+       bool "test"


test.in would either exist in dummy-external, or in BR2_EXTERNAL, so
there is no problem of missing files.
It requires a separate file in BR2_EXTERNAL that has to be present if
you choose to use BR2_EXTERNAL, but can be empty. Moreover, you need
one such file for each choice you want to expand this way.
I'm leaning more towards the preflight check, but I just want to
highlight that expanding a choice from BR2_EXTERNAL is effectively
possible.

>
>> >  - going with the check means that it will still possible to generate
>> >    such configurations, which means we'd still get autobuild failures
>> >    for those (unless the autobuilders are tweaked to recognise this,)
>> >    while it would be a minimal annoyance to the user.
>> >
>>
>> It doesn't look too difficult to me to handle such prebuild checks in a generic way in the autobuilders.
>> Suppose that a magic return code is used if a prebuild check fails (also for the kernel headers check for example), then the autobuilders can check for this magic code and then simply ignore the configuration and generate a new one.
>
> Or we could have a specific make target to allow the autobuilders to
> check a configuration before starting the build.

Yes, that sounds very good too.

Best regards,
Thomas
