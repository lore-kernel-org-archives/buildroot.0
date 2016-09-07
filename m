From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 7 Sep 2016 16:36:44 -0700
Subject: [Buildroot] [PATCH 1/1] php: add --enable-mysqlnd to configure
 options when using mysql extensions
In-Reply-To: <f86e9d4a-64ab-192b-6aaf-27b317eebdbc@je-eigen-domein.nl>
References: <20160907154857.3147-1-bluemrp9@gmail.com>
 <20160907235514.1779aeb6@free-electrons.com>
 <f86e9d4a-64ab-192b-6aaf-27b317eebdbc@je-eigen-domein.nl>
Message-ID: <57D0A48C.8060106@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, Thomas, All,

After applying my patch and rebuilding my system, I was still having 
trouble.
I tracked it down to needing to set mysqli.default_socket in my php.ini 
configuration.
This wasn't necessary before.  I am going to revert my patch, rebuild, 
and test again.
This might have been a false alarm.  I will report back my findings.

On 09/07/2016 04:35 PM, Floris Bos wrote:
> On 09/07/2016 11:55 PM, Thomas Petazzoni wrote:
>> Floris,
>>
>> Could you have a look at the below patch?
>>
>> Thanks!
>>
>> Thomas
>>
>> On Wed,  7 Sep 2016 08:48:57 -0700, Ryan Coe wrote:
>>> Without this configure option, mysqli was failing to build with my
>>> config after commit ea1e9e03442a5b375aa2214ba92e48ebba89070a. The build
>>> did not fail, however, I was unable to use mysqli in my application.
>
> Did you downgrade PHP to an older version, or made any other changes?
> As I am unable to reproduce your issue.
>
> - Cloned buildroot fresh from git.
> - i386, static libs, only enabled PHP + mysqli
>
>
> Let's see if PHP's info page know anything about mysqlnd at runtime:
>
> $ output/target/usr/bin/php -i |grep mysqlnd
> Client API library version => mysqlnd 5.0.12-dev - 20150407 - $Id: 
> 241ae00989d1995ffcbbf63d579943635faf9972 $
> mysqlnd
> mysqlnd => enabled
> Version => mysqlnd 5.0.12-dev - 20150407 - $Id: 
> 241ae00989d1995ffcbbf63d579943635faf9972 $
> Loaded plugins => 
> mysqlnd,debug_trace,auth_plugin_mysql_native_password,auth_plugin_mysql_clear_password
> mysqlnd statistics =>
>
>
> Appearently it does.
> Let's try to connect to a server.
>
>
> output/target/usr/bin/php <<"EOF"
> <?php
> $db = new mysqli("127.0.0.1", "root", "*mypassword*", "");
> echo "Server version: {$db->server_info}\n";
> EOF
> Server version: 5.7.13-0ubuntu0.16.04.2
>
>
> Doesn't seem to need a patch to me.
>
>
> Yours sincerely,
>
> Floris Bos
>
