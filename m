From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 7 Aug 2020 13:12:56 +0200
Subject: [Buildroot] Root password and ssh issues
In-Reply-To: <d0f3148a-c8d3-e5cf-68ee-030699e7abec@bootlin.com>
References: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
 <20200807115412.3b93cbc4@windsurf.home>
 <d0f3148a-c8d3-e5cf-68ee-030699e7abec@bootlin.com>
Message-ID: <20200807131256.5c691f3b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Fri, 7 Aug 2020 12:21:51 +0200, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:

> Hi Thomas,
> 
> Thanks for your quick reply!
> 
> 
> > What is the state of /etc/shadow with the non-working SSH login, and
> > then the state of /etc/shadow after resetting the password with passwd
> > ? I think I remember some issues with the expiration date/time of the
> > password, or something like that.  
> 
> 
> Here are the details
> 
> # ls -la /etc/shadow
> -rw-------??? 1 1000???? 1000?????????? 190 Aug? 7? 2020 /etc/shadow
> 
> # cat /etc/shadow
> root:$5$D1pz/P1l$JCZhyjzCCqmXbnPx7g/mBtNtSSKkMqgctsmV/zBmlR2:::::::
> daemon:*:::::::
> bin:*:::::::
> sys:*:::::::
> sync:*:::::::
> mail:*:::::::
> www-data:*:::::::
> operator:*:::::::
> nobody:*:::::::
> 
> # passwd
> Changing password for root
> New password:
> Bad password: too short
> Retype password:
> passwd: password for root changed by root
> 
> # cat /etc/shadow
> root:$1$SYGd3a37$u2RV/VOsLPqWznY4GR1jU.:13514::::::
> daemon:*:::::::
> bin:*:::::::
> sys:*:::::::
> sync:*:::::::
> mail:*:::::::
> www-data:*:::::::
> operator:*:::::::
> nobody:*:::::::
> 
> # ls -la /etc/shadow
> -rw-------??? 1 1000???? 1000?????????? 174 Aug? 7? 2020 /etc/shadow
> 
> I set the password the "root" (both in "menuconfig" and then through the
> "passwd" command). Only after this command can I login through ssh.
> 

No problem here to login via ssh via preset password (raspberrypi4_64_defconfig with
additional dropbear enabled):

BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_CLIENT=y
BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
BR2_PACKAGE_DROPBEAR_SMALL=y
# BR2_PACKAGE_DROPBEAR_WTMP is not set
# BR2_PACKAGE_DROPBEAR_LASTLOG is not set
# BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not set
BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE=""

What looks strange are your /etc/shadow permissions, should give
root/root for user/group...

What is the /var/log/messages dropbear output for failure/success?

What is your config/defconfig?

Regards,
Peter

> Cheers,
> 
> Michael.
> 
