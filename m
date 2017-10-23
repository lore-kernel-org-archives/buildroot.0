From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:34:12 -0200
Subject: [Buildroot] [next v2 2/7] testing/infra/builder: build with
 target and environment
References: <6455fdd0-c445-09cd-d249-ebfaf275c3fb@mind.be>
Message-ID: <59ed55243b8f5_5e463fc3ac9de39c187bc@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 05:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 27-08-17 00:20, Ricardo Martincoski wrote:
[snip]
>> -    def configure(self):
>> +    # Configure the build
>> +    #
>> +    # makecmdline: a list of arguments to be passed to the make command.
>> +    # e.g. makecmdline=["BR2_EXTERNAL=/path"]
>> +    #
> 
>  Better to do this as a docstring rather than a comment. And use the docstring
> formatting as well.

OK.

> 
>> +    def configure(self, makecmdline=None):
> 
>  Maybe makecmdline -> make_extra_opts ?

Yes. It's better.

> 
>  For symmetry, I'd add both make_extra_opts and make_extra_env here.

OK.

> 
>>          if not os.path.isdir(self.builddir):
>>              os.makedirs(self.builddir)
>>  
>> @@ -22,16 +27,36 @@ class Builder(object):
>>                             "> end defconfig\n")
>>          self.logfile.flush()
>>  
>> -        cmd = ["make",
>> -               "O={}".format(self.builddir),
>> -               "olddefconfig"]
>> +        cmd = ["make", "O={}".format(self.builddir)]
>> +        if makecmdline:
>> +            cmd += makecmdline
> 
>  This allows only a single options to be passed. I would require make_extra_opts
> to be an iterable and do cmd.extend(make_extra_opts) here.
> 
>  Also, if you default it to () instead of None, you don't need the condition.

I will default it to [].

> 
>> +        cmd += ["olddefconfig"]
>> +
>>          ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
>>          if ret != 0:
>>              raise SystemError("Cannot olddefconfig")
>>  
>> -    def build(self):
>> +    # Perform the build
>> +    #
>> +    # makecmdline: a list of arguments to be passed to the make command. It can
>> +    # include a make target.
>> +    # e.g. makecmdline=["foo-source"]
>> +    #
>> +    # env: a dict of variables to be appended (or replaced) in the environment
>> +    # that calls make.
>> +    # e.g. env={"BR2_DL_DIR": "/path"}
>> +    #
>> +    def build(self, makecmdline=None, env=None):
> 
>  env -> make_extra_env

OK.
It also allows me to rename buildenv -> env as you did below.

> 
>> +        buildenv = os.environ.copy()
>> +        if env:
>> +            buildenv.update(env)
>> +
> 
>  Here you could default make_extra_env to {} and do:
> 
>         env = os.environ.copy()
>         env.update(make_extra_env)

Indeed. As long we never change this parameter inside the function we are safe
and the parameter will always point to the same empty dict, NOT falling in
following scenario:
 >>> def f1(a, b={}):
 ...     b[a]=1
 ...     print b
 ... 
 >>> f1(1)
 {1: 1}
 >>> f1(2)
 {1: 1, 2: 1}

> 
>  However, do we really want to keep the environment? Perhaps it's better to
> start with an empty environment anyway...

A completely empty environment won't work because
 subprocess.call(..., env={})
is equivalent to calling 'env -i make' in the buildroot directory, it lacks the
path to host libraries, for instance.
But we can import only PATH from the environment. I will add a separate patch
in the beginning of the series to deal with this while keeping the current -d
precedence over BR2_DL_DIR.

Regards,
Ricardo
