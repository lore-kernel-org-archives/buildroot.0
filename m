From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 09 Jul 2014 11:48:22 +0200
Subject: [Buildroot] [PATCH V5 2/2] google-breakpad: integration into
 Makefile and Config.in
In-Reply-To: <53B252FA.4050100@mind.be>
References: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>	<1403702174-23850-3-git-send-email-pascal.huerst@gmail.com>	<53AB3198.9010908@mind.be>
 <20140629123618.407b95f5@free-electrons.com> <53B252FA.4050100@mind.be>
Message-ID: <53BD0FE6.7090602@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Arnout, Thomas, all

-- snip --

On 01.07.2014 08:19, Arnout Vandecappelle wrote:
> On 29/06/14 12:36, Thomas Petazzoni wrote:
>> On Wed, 25 Jun 2014 22:31:20 +0200, Arnout Vandecappelle wrote:

>>>  Actually, this symbol could be defined inside the google-breakpad/Config.in,
>>> no? Though you probably got a comment before that that is not the right place :-)
>>
>> Yeah, that's tricky. We could turn it into a "select", but then
>> everybody will always see this option related to google-breakpad in the
>> Build options. So I believe the solution of using a 'depends on' is
>> still the most appropriate solution. Maybe a little piece of
>> documentation should be added in the Buildroot manual to explain how
>> the Google Breakpad integration works?
>>
>> However, I don't really like the prompt. Maybe it should be:
>>
>> 	[ ] Enable Google Breakpad support
>> 	   () List of binaries to extract symbols from
> 
>  If it is done in that way, then it really should be in the google breakpad
> package and not in the toolchain menu...
> 
> 
>  However, thinking a bit more about this: the dependency on the target package
> is not correct. There's a dependency on the host package because the host tools
> are used, but it's the responsibility of whatever package is linking against the
> static library to also depend on the target package.
> 
>  So in that case, it is indeed best to keep it in the toolchain menu, remove the
> dependency on the target package, but add a boolean config option to enable
> breakpad to begin with.

Does this look reasonable?

config BR2_GOOGLE_BREAKPAD_ENABLE
  bool "Enable google-breakpad support"
  select BR2_PACKAGE_GOOGLE_BREAKPAD
  help
    This option will enable the use of google breakpad, a library and tool
    suite that allows you to distribute an application to users with
    compiler-provided debugging information removed, record crashes in
    compact "minidump" files, send them back to your server and produce
    C and C++ stack traces from these minidumps.  Breakpad can also
write minidumps on request for programs that have not crashed.

if BR2_GOOGLE_BREAKPAD_ENABLE

config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
  string "List of executables and libraries to extract symbols from"
  default ""
  help
    You may specify a space-separated list of binaries and libraries
    with full paths relative to $(TARGET_DIR) of which debug symbols
    will be dumped for further use with google breakpad.

    A directory structure that can be used by minidump-stackwalk will
    be created at:

    $(STAGING_DIR)/usr/share/google-breakpad-symbols

endif


regards
pascal
