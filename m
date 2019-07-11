From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 11 Jul 2019 15:17:39 +0200
Subject: [Buildroot] [PATCH 1/2] support/script/pkg-stats: run the 3
 `make` calls in parallel
In-Reply-To: <20190711150832.136f7a4e@windsurf>
References: <20190711095448.7417-1-victor.huesca@bootlin.com>
 <20190711150832.136f7a4e@windsurf>
Message-ID: <dc8cdcca-d1bb-b5ff-eeca-5d1bad3306ef@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,



On 11/07/2019 15:08, Thomas Petazzoni wrote:
> Hello Victor,
> 
> On Thu, 11 Jul 2019 11:54:47 +0200
> Victor Huesca <victor.huesca@bootlin.com> wrote:
> 
>> +def check_multiple_output(cmds, *popenargs, **kwargs):
>> +    '''
>> +    Run each `cmd` asynchronousely and return their respective output.
>> +    The execution time is the max of all subprocess execution time.
>> +    '''
>> +    processes = [subprocess.Popen(cmd, *popenargs,
>> +                                  stdout=subprocess.PIPE,
>> +                                  stderr=subprocess.PIPE,
>> +                                  **kwargs) for cmd in cmds]
>> +    for proc in processes:
>> +        out, err = proc.communicate()
>> +        yield out
>> +
>> +
>>  def package_init_make_info():
>> +    # Fetch all variables at once
>> +    licenses, files, versions = check_multiple_output([
>> +        ["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars", "VARS=%_LICENSE"],
>> +        ["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars", "VARS=%_LICENSE_FILES"],
>> +        ["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars", "VARS=%_VERSION"],
> 
> Instead of doing this, what about running:
> 
> 	make printvars VARS="%_LICENSE %_LICENSE_FILES %_VERSION"
> 
> and then parse out the result, which will contain all the _LICENSE,
> _LICENSE_FILES and _VERSION variables ?

Because I did not thought it was possible to do this >_<'
I remember that I tried several syntaxes to retrieve all variables with
a single `make` but did not find a working one and this solution was not
hard to implement...

Thanks for the hint, I'll send a v2 with this -- way better -- approach.

Thanks,
Victor

> Best regards,
> 
> Thomas
> 

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
