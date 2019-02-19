From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Feb 2019 11:53:27 +0100
Subject: [Buildroot] git send-email with Outlook / NTLM ?
In-Reply-To: <20190219101452.5145a2b9@windsurf.home>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35B97@SERBE4I2.intra.erbe-med.de>
 <20190218225858.05f8d246@windsurf.home>
 <2748BB04F99E7E45A3203C831E8B20FE34D35C13@SERBE4I2.intra.erbe-med.de>
 <20190219101452.5145a2b9@windsurf.home>
Message-ID: <CAAXf6LUvTfdU4Ei_2nd-GJ-uMYyNPjR+rbjCCs5vYjO73B2JfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El mar., 19 feb. 2019 a las 10:15, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> I've re-added the Buildroot mailing list in Cc, please keep the list
> Cc'ed for this discussion.
>
> On Tue, 19 Feb 2019 09:01:43 +0000
> "Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:
>
> > The mismatch and also the line wrapping was most likely happening
> > because I needed to send the mail with Outlook. Our SMTP server only
> > allows NTLM auth and I couldn't get git-email-send to work with it
> > (The git-email-send-ntlm project is also not working for me). I don't
> > think I can change the From: within outlook. But I could change the
> > Signed-off-by: to match it if this is better. If you know any way to
> > use git-email-send with NTLM please let me know.
>
> I am in the lucky situation that I don't have to use an Outlook e-mail
> server, so I have no idea if git send-email can work with NTLM. Perhaps
> other people in the list will know ?

First question is: do you really need to use your company's SMTP
server for sending to the Buildroot mailing list. You might be better
off using e.g. gmail SMTP.

You probably have a proxy server that you need to route through, but
it is not impossible.

Previously I used socat to set up a tunnel through the proxy, to gmail smtp.

remotehost=smtp.gmail.com
remoteport=587
localport=10587
proxy=your.proxy.com # or IP address
proxyport=8080
socat TCP4-LISTEN:$localport,reuseaddr,fork
PROXY:$proxy:$remotehost:$remoteport,proxyport=$proxyport,resolve


In your gitconfig, you would then specify 'localhost' and port 10587
as smtp server.

For some reason, this no longer works for me, with error:
STARTTLS failed! hostname verification failed at
/usr/libexec/git-core/git-send-email line 1503.



But git-send-email also allows to specify an external program to send
email. For example, use '/usr/bin/msmtp' as 'smtpserver'. Additional
options can be specified as 'smtpserveroption'.
In my case, I can also use a socks proxy. In .msmtprc I have:


account gmail
host smtp.gmail.com
port 587
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile /home/user/msmtp.log
proxy_host your-socks-proxy
auth on
from user at gmail.com
user user at gmail.com
password your-app-password-for-gmail

and then in .gitconfig

[sendemail]
  smtpserver = /usr/bin/msmtp
  smtpserveroption = -agmail



If gmail is not an option,  you might be able to configure msmtp to
autenticate using NTLM to your company SMTP. The internet suggests
that msmtp supports NTLM via GNU SASL, which in turn uses libntlm.
See:
https://marlam.de/msmtp/
http://josefsson.org/libgsasl/


Best regards,
Thomas
