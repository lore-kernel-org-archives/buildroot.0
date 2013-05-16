From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 10:50:48 +0200
Subject: [Buildroot] Config options for optional dependencies [was:
 [PATCH 6/6] gnutls: bump to version 3.2.0]
In-Reply-To: <51947A07.2080301@mind.be>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <1368463259-18958-6-git-send-email-gustavo@zacarias.com.ar>
 <5192BC67.2070600@mind.be> <5192BF6F.8000800@zacarias.com.ar>
 <51947A07.2080301@mind.be>
Message-ID: <20130516105048.39dd73c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 16 May 2013 08:17:43 +0200, Arnout Vandecappelle wrote:

>   I think it is time that we formalize a bit the rules for optional 
> dependencies.
> 
>   To be honest, I would prefer explicit config options for optional 
> dependencies, because it's not easy for users to realize they can select 
> the additional library. However, that buts an unrealistic (maintenance) 
> overhead on the Config.in files.
> 
>   So as a second-best option, I would say that the optional dependencies 
> should be mentioned in the package help text. It's still not easy on the 
> user, because s/he needs to know how to read the help text and how to 
> search for the relevant package. It's also still a bit of a maintenance 
> burden because the help text has to be updated when optional dependencies 
> are added/removed. But I guess it's a reasonable compromise.

Is this really useful? Isn't the <package>.mk file already explicit
enough about this? I'm pretty sure help texts will get out of sync, and
I'm not sure there's really a point in duplicating the information that
the <package>.mk already provides.

>   With that, I think our informal guideline of adding config options only 
> for obscure libraries becomes less of a necessity, and we can make it a 
> rule to never add config options for optional dependencies.
> 
>   What do you think?

Hum, I'm not sure to understand the current informal guideline as
"adding config options only for obscure libraries".

For features of the package that are not related to a dependency
(enabling debugging, or some other completely internal feature), there
is no other choice than adding a config option.

When there is a dependency, I guess the current rule is a matter of
appreciating whether or not it sounds logical to automatically enable
SSL support when OpenSSL is available, or whether having library foo in
the system immediately indicates that you want support for foo
everywhere. I'm not sure there is a way of having a solution that suits
all cases, without examining each specific case, and having an
appreciation of which choice makes the most sense.

For example, even enabling SSL automatically when OpenSSL is available
is something that could be discussed. It's not because I need SSL for
OpenSSH that I necessarily want my lighttpd web server to gain SSL
support (well, ok, granted, in this specific case, lighttpd has a
sub-option to enable or disable SSL support...). But it makes sense to
have this automatic, and leave it as a user customization if really
it's very important to disable SSL support on a per-package basis.

The drawback of the current solution, is that it is causing some
confusion on what should be done, and how to appreciate the border-line
cases. I unfortunately don't have much ideas here to improve this
situation.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
