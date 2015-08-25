From: Andreas Ehmanns <universeii@gmx.de>
Date: Tue, 25 Aug 2015 21:14:56 +0200
Subject: [Buildroot] Add missing config to RPM target package
In-Reply-To: <55DC379B.5080606@imgtec.com>
References: <55D70AF3.3050604@gmx.de> <55D72A86.1050505@imgtec.com>
 <55DB4584.1000102@gmx.de> <55DC379B.5080606@imgtec.com>
Message-ID: <55DCBEB0.6070100@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 25.08.2015 um 11:38 schrieb Vicente Olivert Riera:
> Dear Andreas,
>
> On 08/24/2015 05:25 PM, universe II wrote:
>> Am 21.08.2015 um 15:41 schrieb Vicente Olivert Riera:
>>> Dear Andreas,
>>>
>>>> diff -Naur a/package/rpm/rpm.mk b/package/rpm/rpm.mk
>>>> --- a/package/rpm/rpm.mk        2015-08-07 11:38:37.559148663 +0200
>>>> +++ b/package/rpm/rpm.mk        2015-08-21 11:13:31.679042077 +0200
>>>> @@ -34,7 +34,7 @@
>>>>    RPM_DEPENDENCIES += pcre
>>>>    RPM_CONF_OPTS += --with-pcre=external
>>>>    else
>>>> -RPM_CONF_OPTS += --with-pcre=none
>>>> +RPM_CONF_OPTS += --with-pcre=internal
>>>>    endif
>>>>
>>>>    ifeq ($(BR2_PACKAGE_FILE),y)
>>> I cannot apply your patch:
>>>
>>> $ wget http://patchwork.ozlabs.org/patch/509471/mbox/ -q -O - | git am
>>> Applying: Add missing config to RPM target package
>>> error: patch failed: package/rpm/rpm.mk:34
>>> error: package/rpm/rpm.mk: patch does not apply
>>> Patch failed at 0001 Add missing config to RPM target package
>>> When you have resolved this problem run "git am --resolved".
>>> If you would prefer to skip this patch, instead run "git am --skip".
>>> To restore the original branch and stop patching run "git am --abort".
>>>
>>> Please make your patches using git, as stated in the Buildroot manual:
>>>
>>> http://buildroot.uclibc.org/downloads/manual/manual.html#submitting-patches
>>>
>>>
>>> Regards,
>>>
>>> Vincent.
>> Dear Vincent,
>> I tried to make my patch using git according to the manual, but I always
>> got an error. Maybe related to my inexperience with git. After 4 hours
>> of different tries I gave up and sent the patch via email. Sorry for the
>> inconvenience.
>>
>> Regards,
>> Andreas
> so, lets see if I can help you.
>
> 1- configure git in order to be able to use "git send-email" and also to
> sign your commits automatically when using "git commit -s". Here is an
> example of a ~/.gitconfig file:
>
> user at localhost ~ $ cat .gitconfig
> [sendemail]
>          smtpencryption = tls
>          smtpserver = your.mail.server.address.here
>          smtpuser = "your.smtp.username"
>          smtpserverport = 25
> 	confirm = always
> [user]
> 	name = Your Full Name Here
> 	email = your.email at address.here
> user at localhost ~ $
>
> That should be enough. But, if you need it, there is more information here:
>
>    http://git-scm.com/docs/git-send-email
>
> 2- clone the Buildroot repository:
>
> user at localhost ~ $ git clone git://git.busybox.net/buildroot
>
> 3- make the changes your want:
>
> user at localhost ~ $ cd buildroot
> user at localhost ~ $ vim package/rpm/rpm.mk
>
> 4- now observe how that file has been modified:
>
> user at localhost ~ $ git status
> # On branch master
> # Changed but not updated:
> #   (use "git add <file>..." to update what will be committed)
> #   (use "git checkout -- <file>..." to discard changes in working
> directory)
> #
> #	modified:   package/rpm/rpm.mk
> #
> no changes added to commit (use "git add" and/or "git commit -a")
>
> user at localhost ~ $ git diff package/rpm/rpm.mk
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index 7f346b2..05b98db 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -34,7 +34,7 @@ ifeq ($(BR2_PACKAGE_PCRE),y)
>   RPM_DEPENDENCIES += pcre
>   RPM_CONF_OPTS += --with-pcre=external
>   else
> -RPM_CONF_OPTS += --with-pcre=none
> +RPM_CONF_OPTS += --with-pcre=internal
>   endif
>
>   ifeq ($(BR2_PACKAGE_FILE),y)
> user at localhost ~ $
>
> 5- now you need to add that modified file to the staging area:
>
> user at localhost ~ $ git add package/rpm/rpm.mk
>
> 6- now if you check the status again, you will see how that file has
> been added to the staging are in order to be committed:
>
> user at localhost ~ $ git status
> # On branch master
> # Changes to be committed:
> #   (use "git reset HEAD <file>..." to unstage)
> #
> #	modified:   package/rpm/rpm.mk
> #
>
> 7- now you have to "commit", so all the changes to the files in the
> staging area (although you only have one file) will be committed. Also
> pass the "-s" option to the commit so your "Signed-off-by" will be added
> automatically taking the value from your ~/.gitconfig file:
>
>
> user at localhost ~ $ git commit -s
>
> A text editor should have opened and now you can write a title in the
> first line and a comment below the title, leaving one blank line between
> them. Please don't write lines longer than 72 characters
> (http://stackoverflow.com/questions/4297574/do-i-need-to-wrap-email-messages-longer-than-72-characters-in-a-line).
>
> 8- now you can see your commit on top of the log history. Run "git log"
> to see the entire log history paged, or just "git log -1" to see the
> most recent commit (which should be yours). This in an example of how it
> would look like:
>
> user at localhost ~ $ git log -1
> commit 8eb4fddc0ff18b51fbcc5011f1d1d159e4169922
> Author: Your Full Name Here <your.email@address.here>
> Date:   Tue Aug 25 10:28:47 2015 +0100
>
> package/rpm: use the internal pcre when the external is not provided
>
> If the regular expression package pcre is enabled in buildroot, rpm will
> use it. If not, nothing will be used and regular expression are not
> available, making rpm unusable. But rpm has the ability to use an
> internal pcre implementation if the external lib is not available. This
> needs to be correctly activated before building and then rpm works fine
> on the target.
>
> Signed-off-by: Your Full Name Here <your.email@address.here>
> user at localhost ~ $
>
> 9- submit that commit by email using "git send-email", so it will format
> the patch automatically using "git format-patch" (again, this is an
> example of how it would look like):
>
> user at localhost ~ $ git send-email --to=buildroot at buildroot.org -1
> /tmp/s5ZjTPKm7e/0001-package-rpm-use-the-internal-pcre-when-the-external-.patch
> Who should the emails appear to be from? [Your Full Name Here
> <your.email@address.here>]
> Emails will be sent from: Your Full Name Here <your.email@address.here>
> Message-ID to be used as In-Reply-To for the first email?
> (mbox) Adding cc: Your Full Name Here <your.email@address.here> from
> line 'From: Your Full Name Here <your.email@address.here>'
> (body) Adding cc: Your Full Name Here <your.email@address.here> from
> line 'Signed-off-by: Your Full Name Here <your.email@address.here>'
>
> From: Your Full Name Here <your.email@address.here>
> To: buildroot at buildroot.org
> Cc: Your Full Name Here <your.email@address.here>
> Subject: [PATCH] package/rpm: use the internal pcre when the external is
> not provided
> Date: Tue, 25 Aug 2015 10:35:41 +0100
> Message-Id: <1440495341-1861-1-git-send-email-your.email@address.here>
> X-Mailer: git-send-email 1.7.1
>
> Send this email? ([y]es|[n]o|[q]uit|[a]ll):
>
> 10- check that information and if everything looks fine, then press "y"
> so the email will be sent using the stmp server you stated in your
> ~/.gitconfig file.
>
>
> Regards,
>
> Vincent.
Dear Vincent,
thanks a lot for your support. I spent some time to google around but 
wasn't able to find a clue. Finally I fixed the problem by reinstalling 
my linux box. Don't know what the real problem was.
Now everything is working fine.

Regards,
Andreas
