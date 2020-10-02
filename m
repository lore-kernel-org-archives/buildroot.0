From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 2 Oct 2020 11:50:37 +0200
Subject: [Buildroot] [PATCH] package/python-werkzeug: bump version to
 1.0.1
In-Reply-To: <20200930195646.GT11621@scaer>
References: <20200930073204.32070-1-buildroot@heine.tech>
 <20200930195646.GT11621@scaer>
Message-ID: <9cf9f937-5fc2-fab2-354a-6c59705de401@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 30.09.2020 21:56, Yann E. MORIN wrote:
> Michael, All,
> 
>>  #
>>  ################################################################################
>>  
>> -PYTHON_WERKZEUG_VERSION = 0.16.0
>> +PYTHON_WERKZEUG_VERSION = 1.0.1
> 
> It's been pointed out on IRC that "there were a number of breaking
> changes in that jump", further pointing to the release notes:
> 
>     https://werkzeug.palletsprojects.com/en/1.0.x/changes/#version-1-0-0
> 
> We have two packages in Buildroot, that use werkzeug: crossbar and
> flask.
> 
> Could you investigate how they are both impacted, if at all, by this
> bump, please?
> 
> Note that your patch has already been applied, and we'd like to know
> if we also need to update crossbar or flask, or if we need to revert.
> 


We already discussed this on IRC. But for documentation a short write-up:

Werkzeug 1.0.1 was released on 2020-03-31.

Flask in BR is on 1.1.2 which was released on 2020-04-03
Crossbar in BR is on  20.4.2 released on 2020-04-14

So both releases were after the Werkzeug Release and for Flask we even
are on the latest version.

I can't say much about crossbar as I don't use it. But at least their
issue tracker [0] and their changelog [1] have no mentions of any
Werkzeug related issues.


For Flask I can say: the package itself works fine on my target.

Things that actually broke:

* my local package for flask-wtf which could be fixed with a version bump.

* my own code using flask which I had to update. Werkzeug 0.16.0 shows
deprecation warnings like

DeprecationWarning: The import 'werkzeug.secure_filename' is deprecated
and will be removed in Werkzeug 1.0. Use 'from werkzeug.utils import
secure_filename' instead.

but running in gunicorn they are lost somewhere...

So it might be an issue for some user code or external packages but the
depending packages seem to be fine.

Bonus: I actually found some other deprecations my code uses from other
packages while checking this ;)

Regards,
Michael

[0] https://github.com/crossbario/crossbar/issues?q=is%3Aissue+werkzeug
[1] https://crossbar.io/docs/changelog/
