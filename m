From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 18:32:01 -0300
Subject: [Buildroot] [PATCH v3 2/9] testing/infra/builder: split
 configure() from build()
References: <20180401195916.29aac7e1@windsurf>
Message-ID: <5ac14fd11a596_e002ac6eaeaec8891974@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 01, 2018 at 02:59 PM, Thomas Petazzoni wrote:

> On Sun, 29 Oct 2017 12:06:01 -0200, Ricardo Martincoski wrote:
> I've applied, but I have a comment, see below.
> 
> 
>> +    def build(self):
>> +        env = {"PATH": os.environ["PATH"]}
> 
> So now, we have the same local "env" variable in configure() and
> build(). Would it make sense to do:
> 
> 	self.env = ...
> 
> in the constructor, and then use it in configure() and build() ?

It is possible to do that.

The next patch on the same series uses .update() so the local "env" is changed.
        env = {"PATH": os.environ["PATH"]}
        env.update(make_extra_env)

Note: I did not tested the code below.

In order to always have a clean environment, we could do in the constructor:
        self.env = {"PATH": os.environ["PATH"]}
And change the methods to:
        env = self.env.copy()
        env.update(make_extra_env)

Or we assume we will need only PATH from env in the future, and do in the
constructor:
        self.env_path = os.environ["PATH"]
And change the methods to:
        env = self.make_extra_env.copy()
        env.update({"PATH": self.env_path})

The access to os.environ should be inexpensive (I did not measured it), so I am
not sure it needs to be done. I am not against it either.
At first glance, it seems just more code to me.
Maybe I am missing something.


Regards,
Ricardo
